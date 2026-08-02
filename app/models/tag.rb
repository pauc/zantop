# frozen_string_literal: true

class Tag < ApplicationRecord
  include HasSlugs
  include HasTranslations

  friendly_id :name, use: [:slugged, :simple_i18n, :history]

  translates :name, plain: true

  has_many :taggings, dependent: :destroy
  has_many :works, through: :taggings, source: :work

  # attr_accessor :name

  validates :name, presence: true

  before_save :name_to_underscore

  # `published` and not `visible`: this is the navigation every page carries,
  # and a tag worth navigating to is one with something published under it. The
  # owner reaches a tag that only holds drafts from `tags#admin`, and the works
  # themselves from `works#admin`.
  scope :enabled, -> { distinct.joins(:works).merge(Work.published) }

  def untranslated?
    plain_text_translations.size < 3
  end

  private

  # Both locales, because `HasTranslations` seeds the default locale from the
  # one being written and runs first: a tag typed as "Escultura" on /es would
  # otherwise be stored downcased in Spanish and capitalised in Catalan, and the
  # tag navigation reads the Catalan one.
  def name_to_underscore
    [I18n.locale, I18n.default_locale].uniq.each do |locale|
      I18n.with_locale(locale) do
        next if name.blank?

        self.name = name.downcase
      end
    end
  end
end
