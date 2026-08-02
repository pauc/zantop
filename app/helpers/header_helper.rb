# frozen_string_literal: true

module HeaderHelper
  # Each language names itself, in its own language: someone looking for a
  # version of the site they can read finds it under a name they recognise or
  # not at all, so these three are deliberately not translated. The `lang`
  # attribute on the link is what makes a screen reader pronounce them.
  #
  # The visible text is the abbreviation the design has always used; each one
  # is a prefix of the full name, so the name a speech-input user says out
  # loud still matches what they see.
  LANGUAGES = { es: %w[cast Castellano], ca: %w[cat Català], en: %w[eng English] }.freeze

  def lang_selector
    safe_join(LANGUAGES.map { |locale, (abbreviation, language)|
      tag.li(lang_link(locale, abbreviation, language))
    })
  end

  private

  # `page_record` is what makes the Spanish link point at the Spanish slug
  # rather than at the current locale's slug under the /es prefix, which only
  # resolves because the lookup matches any of the three slug columns.
  def lang_link(locale, abbreviation, language)
    current = locale == I18n.locale

    link_to abbreviation,
            localized_url(locale, page_record, only_path: true),
            lang: locale,
            hreflang: locale,
            "aria-label": language,
            "aria-current": ("page" if current),
            class: ("current" if current)
  end
end
