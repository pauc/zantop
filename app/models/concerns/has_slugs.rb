# frozen_string_literal: true

module HasSlugs
  def self.included(klass)
    klass.extend FriendlyId
    klass.extend ClassMethods
    klass.prepend Extension

    klass.before_save do
      ([:en, :es, :ca] - [I18n.locale]).each do |locale|
        next if public_send("slug_#{locale}?")

        public_send("slug_#{locale}=", slug)
      end
    end
  end

  def slug
    public_send("slug_#{I18n.locale}") || public_send("slug_#{I18n.default_locale}")
  end

  def translation?(locale)
    translation = translations.select { |tr| tr.locale == locale }
    translation.present?
  end

  module ClassMethods
    private

    def first_by_friendly_id(id)
      parse_friendly_id(id).then { |friendly_id|
        where("slug_ca = :slug or slug_es = :slug or slug_en = :slug", slug: friendly_id).first
      }
    end
  end

  module Extension
    def should_generate_new_friendly_id?
      public_send("#{friendly_id_config.base}_changed?")
    end
  end
end
