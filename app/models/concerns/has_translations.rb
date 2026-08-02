# frozen_string_literal: true

module HasTranslations
  def self.included(klass)
    klass.extend(Mobility)

    klass.before_save :seed_default_locale
  end

  def translated_into?(locale)
    return true if (plain_text_translations + rich_text_translations)
                   .any? { |translation| translation.locale.to_s == locale.to_s }

    false
  end

  private

  # Content written while the admin is reading the site in Spanish or English
  # would otherwise leave the default locale with nothing in it, and the default
  # locale is what the front page and every visitor who has not asked for
  # another one gets. Fallbacks do not rescue it: they run *towards* :ca, so a
  # work created on /en reads back blank on /ca rather than reading in English.
  #
  # So the first locale to write an attribute seeds the default locale with it,
  # which is what HasSlugs' before_save already does with the slug columns —
  # this is the same rule applied to the content those slugs point at. It is
  # only a seed: a value already there is never overwritten, so translating
  # later loses nothing, and the record is written in one save either way.
  #
  # The cost is that the record then counts as `translated_into?(:ca)` while it
  # still reads in another language, so it loses the untranslated warning on the
  # default locale. That is the better half of the bargain: the alternative is a
  # work that is blank on the site it was just added to.
  def seed_default_locale
    return if I18n.locale == I18n.default_locale

    self.class.mobility_attributes.each do |attribute|
      next if public_send(attribute, locale: I18n.default_locale, fallback: false).present?

      value = public_send(attribute, fallback: false)

      next if value.blank?

      # A rich text attribute reads back as its translation record. Assigning
      # that record along would store its `to_s`, which is the *rendered*
      # content, `<div class="trix-content">` wrapper and all.
      value = value.body.to_html if value.is_a?(ActionText::RichText)

      # Through the plain writer rather than Mobility's `#{attribute}_ca=`
      # accessor, which passes the locale as a second argument: `Image#credits=`
      # overrides the writer and takes one.
      I18n.with_locale(I18n.default_locale) { public_send("#{attribute}=", value) }
    end
  end
end
