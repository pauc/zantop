# frozen_string_literal: true

RSpec.describe HasSlugs do
  # The concern only makes sense on a model, so the examples below include it into a
  # throwaway one. The table is created inside the example's own transaction and goes
  # away with the rollback, so nothing leaks between examples.
  before do
    ActiveRecord::Base.connection.create_table("things") do |t|
      t.string :title
      t.string :slug_ca
      t.string :slug_es
      t.string :slug_en
    end
  end

  # A model that has not included the concern yet.
  let(:plain_model) do
    stub_const("Thing", Class.new(ApplicationRecord) { self.table_name = "things" })
  end

  # The same model, with the concern included and friendly_id configured.
  let(:model) do
    plain_model.tap do |klass|
      klass.include(described_class)
      klass.friendly_id :title, use: [:slugged, :simple_i18n, :history]
    end
  end

  describe ".included" do
    it "extends the model with FriendlyId" do
      plain_model.include(described_class)

      expect(plain_model.singleton_class).to be < FriendlyId
    end

    it "leaves a model that does not include it without FriendlyId" do
      expect(plain_model.singleton_class).not_to be < FriendlyId
    end

    it "gives the model the slug reader" do
      plain_model.include(described_class)

      expect(plain_model.new).to respond_to(:slug)
    end

    it "installs the lookup across the slug columns" do
      record = model.create!(title: "Peas")

      expect(model.find("peas")).to eq record
    end

    it "fills in a slug for every locale on save" do
      thing = model.create!(title: "Tinc tanta sang que a les cinc tinc son")

      expect([thing.slug_ca, thing.slug_es, thing.slug_en])
        .to all(eq("tinc-tanta-sang-que-a-les-cinc-tinc-son"))
    end

    it "keeps a slug already set for another locale" do
      thing = model.create!(title: "No m'agraden els pèsols",
                            slug_es: "no-me-gustan-los-guisantes")

      expect(thing.slug_es).to eq "no-me-gustan-los-guisantes"
    end

    it "fills in only the locales that have no slug" do
      thing = model.create!(title: "No m'agraden els pèsols", slug_en: "i-dislike-peas")

      expect([thing.slug_ca, thing.slug_es]).to all(eq("no-m-agraden-els-pesols"))
    end

    it "lets friendly_id own the slug of the current locale" do
      thing = I18n.with_locale(:es) {
        model.create!(title: "No m'agraden els pèsols", slug_es: "guisantes")
      }

      expect(thing.slug_es).to eq "no-m-agraden-els-pesols"
    end

    it "copies the current locale's slug into the other locales" do
      thing = I18n.with_locale(:en) { model.create!(title: "I dislike peas") }

      expect([thing.slug_ca, thing.slug_es]).to all(eq("i-dislike-peas"))
    end

    it "changes the slug of the current locale when the title changes" do
      thing = model.create!(title: "Tinc tanta sang que a les cinc tinc son")

      thing.update!(title: "M'agrae!!")

      expect(thing.slug).to eq "m-agrae"
    end

    it "leaves the slugs of the other locales alone when the title changes" do
      thing = model.create!(title: "Tinc tanta sang que a les cinc tinc son")

      thing.update!(title: "M'agrae!!")

      expect([thing.slug_es, thing.slug_en])
        .to all(eq("tinc-tanta-sang-que-a-les-cinc-tinc-son"))
    end
  end

  describe "#slug" do
    it "returns the slug of the current locale" do
      thing = model.create!(title: "Peas", slug_en: "peas-en", slug_ca: "peas-ca")

      expect(I18n.with_locale(:en) { thing.slug }).to eq "peas-en"
    end

    it "falls back to the default locale when the current one has no slug" do
      thing = model.new(title: "Peas", slug_ca: "peas-ca")

      expect(I18n.with_locale(:en) { thing.slug }).to eq "peas-ca"
    end

    it "is nil when neither the current nor the default locale has a slug" do
      thing = model.new(title: "Peas")

      expect(I18n.with_locale(:en) { thing.slug }).to be_nil
    end
  end

  describe "#should_generate_new_friendly_id?" do
    it "is true when the friendly id base changed" do
      thing = model.new(title: "Peas")

      expect(thing.should_generate_new_friendly_id?).to be true
    end

    it "is false when the friendly id base is untouched" do
      thing = model.create!(title: "Peas")

      expect(thing.should_generate_new_friendly_id?).to be false
    end

    it "is false when another attribute changed" do
      thing = model.create!(title: "Peas")
      thing.slug_es = "guisantes"

      expect(thing.should_generate_new_friendly_id?).to be false
    end
  end

  describe ".find" do
    it "finds by the Catalan slug" do
      thing = model.create!(title: "Pèsols", slug_es: "guisantes", slug_en: "peas")

      expect(model.find("pesols")).to eq thing
    end

    it "finds by the English slug" do
      thing = model.create!(title: "Pèsols", slug_es: "guisantes", slug_en: "peas")

      expect(model.find("peas")).to eq thing
    end

    it "finds by the slug of a locale other than the current one" do
      thing = model.create!(title: "No m'agraden els pèsols",
                            slug_es: "no-me-gustan-los-guisantes")

      expect(I18n.with_locale(:ca) { model.find("no-me-gustan-los-guisantes") }).to eq thing
    end

    it "finds by a slug the record used to have" do
      thing = model.create!(title: "No m'agraden els pèsols")

      I18n.with_locale(:es) do
        thing.update!(title: "No me gustan los guisantes")
        thing.update!(title: "Tengo un poco de sueño")
      end

      expect(I18n.with_locale(:ca) { model.find("no-me-gustan-los-guisantes") }).to eq thing
    end

    it "still finds by the primary key" do
      thing = model.create!(title: "Pèsols")

      expect(model.find(thing.id)).to eq thing
    end

    it "does not match a slug belonging to another record" do
      model.create!(title: "Pèsols")
      other = model.create!(title: "Cigrons")

      expect(model.find("cigrons")).to eq other
    end

    it "raises when no record matches the slug" do
      expect { model.find("no-such-slug") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
