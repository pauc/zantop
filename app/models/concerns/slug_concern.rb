# frozen_string_literal: true

module SlugConcern
  extend ActiveSupport::Concern

  included do
    before_save do
      value = slug
      [:en, :es, :ca].each do |locale|
        send("slug_#{locale}=", value) unless send("slug_#{locale}?")
      end
    end
  end

  def slug
    result = send("slug_#{I18n.locale}")
    result.presence || send("slug_#{I18n.default_locale}")
  end

  def translation?(locale)
    translation = translations.select { |tr| tr.locale == locale }
    translation.present?
  end
end
