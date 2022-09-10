# frozen_string_literal: true

class TranslationsMigrator
  def initialize(db: ActiveRecord::Base.connection, table:)
    log("Start migrating translations for table `#{table}`")
    @db = db
    @table = table
  end

  def call
    translations.each(&method(:migrate_translation))
  end

  private

  attr_reader :db, :table

  def translations
    @translations ||= db.exec_query("select * from #{table}")
  end

  def migrate_translation(data)
    record_id = data.fetch(foreign_key)
    locale = data.fetch("locale")

    log("\tMigrating translations for #{record_type}##{record_id} - (#{locale})")

    attributes.each do |attribute|
      content = data.fetch(attribute)
      next if content.blank?

      record = ActionText::RichText.find_or_initialize_by(
        name: attribute,
        record_type:,
        record_id:,
        locale:
      )

      record.body = content

      new_record = record.new_record?

      record.save! if new_record

      log("\t\tTranslation for `#{attribute}` already exists") unless new_record
      log("\t\tTranslation created for `#{attribute}` => #{record.id}") if new_record
    end
  end

  def foreign_key
    @foreign_key ||= columns.find { |attr| attr.end_with?("_id") }
  end

  def record_type
    @record_type ||= foreign_key
                     .delete_suffix("_id")
                     .capitalize
  end

  def attributes
    @attributes ||= columns - %w[id locale created_at updated_at] - [foreign_key]
  end

  def columns
    @columns = translations.first.keys
  end

  def log(what)
    Rails.logger.info(what)
  end
end

desc "Migrates translations to Mobility records with action_text backend"
task migrate_translations: :environment do
  Rails.logger = Logger.new($stdout)
  Rails.logger.level = :info

  db = ActiveRecord::Base.connection

  tables = db
           .exec_query("select table_name from information_schema.tables where table_schema='public'") # rubocop:disable Layout/LineLength
           .rows
           .flatten
           .grep(/_translations\z/)


  tables.each do |table|
    TranslationsMigrator.new(db:, table:).call
  end
end
