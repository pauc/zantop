# frozen_string_literal: true

# Decides what an edit form shows for a translated attribute, on every
# `f.input` there is, so a form written later cannot forget to ask.
#
# The rule is that a box may only ever show what its own locale holds, because
# whatever a box shows is what saving stores. Read through Mobility's fallbacks,
# which run *towards* :ca, the English form of a work written only in Catalan
# comes up full of Catalan text; pressing Guardar stores it as the English
# translation, `translated_into?(:en)` turns true, and the untranslated warning
# disappears from a page with nothing translated on it.
#
# So the value is read with `translation_of`, which names its locale and takes
# no fallback, and an untranslated field arrives empty. The Catalan text is not
# taken away, it moves: `untranslated_reference` offers it as a hint under the
# empty box, where the admin can translate from it and no submit can carry it
# back. The alternative — pre-fill, then compare on the way in and drop the
# value if it came back unchanged — leaves the admin unable to tell which
# fields are translated, and quietly ignores anyone who means to type the same
# word in two languages.
#
# Form objects answer half of this. `WorkForm#initialize` fills its own
# attributes with the same locale-only read, and after an invalid submit they
# hold what the admin typed, which the record knows nothing about and must not
# overwrite — so a form object defines `untranslated_reference` and no
# `translation_of`, and its value is left alone.
module TranslatedInputs
  def input(attribute_name, options = {}, &)
    return super unless object.respond_to?(:translated_attribute?)
    return super unless object.translated_attribute?(attribute_name)

    super(attribute_name, translated_input_options(attribute_name, options), &)
  end

  private

  def translated_input_options(attribute_name, options)
    options = options.dup

    # Nothing translated can be required outside the default locale, where a
    # blank box means "not translated yet" and the record keeps what it has.
    # SimpleForm marks fields from the model's validators, which know nothing
    # about locales, and Trix's editor is form-associated: `Section` validates
    # the presence of its body, so one untranslated section was enough for the
    # browser to refuse to submit the whole work, with nothing to say about it.
    options[:required] = false unless I18n.locale == I18n.default_locale

    if object.respond_to?(:translation_of)
      value = { value: object.translation_of(attribute_name) }
      options[:input_html] = value.merge(options[:input_html] || {})
    end

    reference = object.untranslated_reference(attribute_name)
    options[:hint] ||= untranslated_hint(reference) if reference.present?

    options
  end

  # One string, since that is all a hint is. The newline is what separates the
  # heading from the text; `.help-block` renders it, so a description keeps the
  # paragraph breaks it was written with.
  def untranslated_hint(reference)
    heading = @template.t("untranslated_field", language: @template.t(I18n.default_locale))

    "#{heading}\n#{reference}"
  end
end

SimpleForm::FormBuilder.prepend(TranslatedInputs)
