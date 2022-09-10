# frozen_string_literal: true

module HasTranslations
  def self.included(klass)
    klass.extend(Mobility)
  end

  def translated_into?(locale)
    return true if (plain_text_translations + rich_text_translations)
                    .any? { |translation| translation.locale.to_s == locale.to_s }

    false
  end
end
