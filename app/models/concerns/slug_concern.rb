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
    result = self.send("slug_#{I18n.locale}")
    if result.blank?
      self.send("slug_#{I18n.default_locale}")
    else 
      result
    end
  end

  def has_translation?(locale)
    translation = translations.select { |tr| tr.locale == locale }
    !translation.blank?
  end
end
