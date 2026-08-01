# frozen_string_literal: true

# Guards the locale files against the drift this suite was written for: a key
# spelled `untranslated_conten` in one file and `untranslated_content` in the
# other two renders a translation-missing span rather than failing loudly.
#
# Every assertion here reads the YAML rather than calling `I18n.t`, because
# `config.i18n.fallbacks` makes both `I18n.t` and `I18n.exists?` answer for
# Catalan when the locale asked for has nothing — which is exactly the mistake
# being looked for.
RSpec.describe "locale files" do
  def flatten_keys(value, prefix = "")
    return [prefix] unless value.is_a?(Hash)

    value.flat_map do |key, nested|
      flatten_keys(nested, prefix.empty? ? key.to_s : "#{prefix}.#{key}")
    end
  end

  def keys_for(group, locale)
    path = Rails.root.join("config/locales/#{group}.#{locale}.yml")

    flatten_keys(YAML.unsafe_load_file(path).fetch(locale.to_s)).sort
  end

  def declared_keys(locale)
    %w[views simple_form rails].flat_map { |group| keys_for(group, locale) }
  end

  # `rails.en.yml` is deliberately not in here: Rails ships its own `en`
  # defaults, so only `ca` and `es` have to restate them.
  %w[views simple_form].each do |group|
    describe "#{group}.*.yml" do
      it "declares the same keys in every locale" do
        expect(keys_for(group, :es)).to eq keys_for(group, :ca)
        expect(keys_for(group, :en)).to eq keys_for(group, :ca)
      end
    end
  end

  describe "rails.ca.yml and rails.es.yml" do
    it "declare the same keys" do
      expect(keys_for("rails", :es)).to eq keys_for("rails", :ca)
    end
  end

  describe "the keys the code looks up" do
    # Each of these is reached through a lazy or interpolated lookup, so a typo
    # in the locale file survives until the page renders. `simple_form.yes` and
    # `simple_form.no` are here for a second reason: they are YAML 1.1 booleans,
    # so an unquoted `yes:` key parses as `true` and is never found.
    lookups = %w[
      untranslated_content
      restricted_access
      sessions.create.invalid_login
      contact_messages.create.confirmation
      works.labels.dimensions
      works.labels.techniques
      simple_form.yes
      simple_form.no
      simple_form.labels.contact_message.send
      activerecord.models.tag.one
    ]

    %i[ca es en].each do |locale|
      lookups.each do |key|
        it "declares #{key} in #{locale}" do
          expect(declared_keys(locale)).to include key
        end
      end
    end

    # English gets this one from the defaults Rails itself ships.
    %i[ca es].each do |locale|
      it "declares helpers.submit.update in #{locale}" do
        expect(declared_keys(locale)).to include "helpers.submit.update"
      end
    end
  end

  describe "activerecord.models.tag" do
    # The tags admin renders a bare `f.button :submit`, which interpolates the
    # model name into `helpers.submit.update`.
    %i[ca es en].each do |locale|
      it "names the model in #{locale} rather than falling back to the class" do
        expect(Tag.model_name.human(locale:)).not_to eq "Tag"
      end
    end
  end
end
