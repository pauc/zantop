# frozen_string_literal: true

module HasTranslations
  def translated_into?(locale)
    translation = translations.select { |tr| tr.locale == locale }
    translation.present?
  end
end
