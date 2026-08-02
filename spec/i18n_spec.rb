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
    #
    # The `simple_form.labels` entries are here for a third reason: SimpleForm
    # humanises the attribute name when it finds no key, so a missing label
    # renders in English on an otherwise Catalan form instead of announcing
    # itself. `image.video`, `image.credits` and `defaults.tags` did exactly
    # that, showing `Video`, `Credits` and `Tags` next to `Imatge:` and `Lloc:`.
    lookups = %w[
      untranslated_content
      restricted_access
      sessions.create.invalid_login
      dashboards.contact.mailbox_html
      works.labels.dimensions
      works.labels.techniques
      meta.descriptions.visual_works
      meta.descriptions.action_works
      simple_form.yes
      simple_form.no
      activerecord.models.tag.one
      simple_form.labels.defaults.tags
      simple_form.labels.image.video
      simple_form.labels.image.credits
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

  describe "simple_form.labels" do
    # The forms put the colon in the translation rather than in the markup, so a
    # label that omits it is as visibly wrong as one left in English — and, like
    # a humanised fallback, it renders happily.
    def flatten_leaves(value, prefix = "")
      return { prefix => value } unless value.is_a?(Hash)

      value.reduce({}) { |all, (key, nested)|
        all.merge(flatten_leaves(nested, prefix.empty? ? key.to_s : "#{prefix}.#{key}"))
      }
    end

    def labels_for(locale)
      path = Rails.root.join("config/locales/simple_form.#{locale}.yml")
      labels = YAML.unsafe_load_file(path).fetch(locale.to_s).fetch("simple_form").fetch("labels")

      flatten_leaves(labels)
    end

    %i[ca es en].each do |locale|
      it "ends every field label with a colon in #{locale}" do
        expect(labels_for(locale).reject { |_key, text| text.end_with?(":") }).to be_empty
      end
    end
  end

  describe "simple_form.labels and simple_form.hints" do
    # SimpleForm scopes both namespaces by the *object* name — `user`, not
    # `users` — building its lookups from `lookup_model_names`, which is the
    # form's `object_name` split on `[`/`]` with `_attributes` stripped. So the
    # first segment under either namespace is always a form object's
    # `param_key`, or the literal `defaults` it falls back to.
    #
    # Anything else is a key nothing will ever ask for, and it fails the way
    # `hints.users.edit.password` did: the file reads correctly, the key
    # resolves when you look it up by hand, and the page renders no hint at
    # all. A plural is the easy way to write one, but so is a typo, so this
    # asks the stronger question — is this the name of something we can build
    # a form for?
    def form_object_names
      Rails.application.eager_load!

      Rails.root.glob("app/{models,forms}/**/*.rb").filter_map { |path|
        klass = path.relative_path_from(Rails.root.join("app"))
                    .to_s
                    .sub(%r{\A(models|forms)/}, "")
                    .delete_suffix(".rb")
                    .camelize
                    .safe_constantize

        klass.model_name.param_key if klass.respond_to?(:model_name)
      }
    end

    def scopes_for(locale, namespace)
      path = Rails.root.join("config/locales/simple_form.#{locale}.yml")

      YAML.unsafe_load_file(path)
          .fetch(locale.to_s)
          .fetch("simple_form")
          .fetch(namespace, {})
          .keys
    end

    namespaces = %w[labels hints]

    %i[ca es en].each do |locale|
      namespaces.each do |namespace|
        it "scopes #{namespace} by a name SimpleForm looks up, in #{locale}" do
          expect(scopes_for(locale, namespace) - ["defaults"] - form_object_names).to be_empty
        end
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
