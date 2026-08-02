# frozen_string_literal: true

module HasTranslations
  def self.included(klass)
    klass.extend(Mobility)

    klass.before_save :seed_default_locale
  end

  # A row with nothing in it is not a translation. Mobility keeps the row when
  # an attribute is written blank rather than deleting it, so counting rows
  # would call a work whose English title has been cleared translated into
  # English, and the untranslated warning would stay hidden on a page that has
  # nothing English left on it.
  def translated_into?(locale)
    return true if translation_rows.any? { |row|
      row.locale.to_s == locale.to_s && row.body.present?
    }

    false
  end

  def translated_attribute?(attribute)
    self.class.mobility_attributes.include?(attribute.to_s)
  end

  # The value this locale itself holds, with no fallback to any other one.
  # Every edit form reads through here, because whatever an input shows is what
  # saving stores: pre-filled through the fallbacks, which run *towards* :ca, an
  # untouched English box would store the Catalan text as the English
  # translation and silence the untranslated warning with nothing translated.
  #
  # Rich text reads back as its translation record, whose `to_s` is the
  # *rendered* content, `<div class="trix-content">` wrapper and all. What Trix
  # puts in its hidden input, and reads back out of it, is the Trix markup.
  def translation_of(attribute, locale: I18n.locale)
    value = read_without_fallback(attribute, locale)

    value.is_a?(ActionText::RichText) ? value.body&.to_trix_html : value
  end

  # What the default locale says, for an attribute this locale has not
  # translated: the text an edit form offers the admin to translate from, next
  # to the empty box rather than inside it. Nil when there is nothing to offer,
  # which includes reading the default locale itself.
  #
  # As plain text, because it is there to be read and retyped, not to be saved:
  # a paragraph of Trix markup would be worse at both.
  def untranslated_reference(attribute)
    return if read_without_fallback(attribute, I18n.locale).present?

    value = read_without_fallback(attribute, I18n.default_locale)

    value.is_a?(ActionText::RichText) ? value.body&.to_plain_text : value
  end

  private

  # Both associations are scoped to the attributes declared through them, so
  # each holds half of a record's rows and both have to be asked. Mobility
  # defines only the ones a model's `translates` calls need, though: `Image`
  # translates nothing but plain text, and naming `rich_text_translations` on
  # one raises.
  def translation_rows
    %i[plain_text_translations rich_text_translations]
      .select { |association| respond_to?(association) }
      .flat_map { |association| public_send(association) }
  end

  # Mobility disables fallbacks for a read that names its locale, and again for
  # one that passes `fallback: false`. Both are said here: the first is what
  # makes the read specific, the second is what makes it obvious.
  def read_without_fallback(attribute, locale)
    public_send(attribute, locale:, fallback: false)
  end

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
      next if read_without_fallback(attribute, I18n.default_locale).present?

      value = read_without_fallback(attribute, I18n.locale)

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
