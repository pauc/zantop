# frozen_string_literal: true

RSpec.describe HasSlugs, type: :model do
  before :all do
    ActiveRecord::Base.connection.create_table("things") do |t|
      t.string :title
      t.string :slug_ca
      t.string :slug_es
      t.string :slug_en
    end
  end

  after :all do
    ActiveRecord::Base.connection.drop_table("things")
  end

  class DummyTestClass < ApplicationRecord
    self.table_name = "things"

    include HasSlugs

    friendly_id :title, use: [:slugged, :simple_i18n, :history]
  end

  it "has slugs for all the languages on save" do
    thing = DummyTestClass.create(title: "Tinc tanta sang que a les cinc tinc son")

    I18n.available_locales.each do |locale|
      expect(thing.public_send("slug_#{locale}")).to eq "tinc-tanta-sang-que-a-les-cinc-tinc-son"
    end
  end

  it "changes the slug when the title changes" do
    thing = DummyTestClass.create(title: "Tinc tanta sang que a les cinc tinc son")
    thing.update!(title: "M'agrae!!")

    expect(thing.slug).to eq "m-agrae"

    (I18n.available_locales - [I18n.locale]).each do |locale|
      expect(thing.public_send("slug_#{locale}")).to eq "tinc-tanta-sang-que-a-les-cinc-tinc-son"
    end
  end

  describe ".included" do
    it "keeps a slug already set for another locale" do
      thing = DummyTestClass.create(title: "No m'agraden els pèsols",
                                    slug_es: "no-me-gustan-los-guisantes")

      expect(thing.slug_es).to eq "no-me-gustan-los-guisantes"
    end

    it "fills in only the locales that have no slug" do
      thing = DummyTestClass.create(title: "No m'agraden els pèsols", slug_en: "i-dislike-peas")

      expect(thing.slug_ca).to eq "no-m-agraden-els-pesols"
      expect(thing.slug_es).to eq "no-m-agraden-els-pesols"
      expect(thing.slug_en).to eq "i-dislike-peas"
    end

    it "lets friendly_id own the slug of the current locale" do
      thing = I18n.with_locale(:es) {
        DummyTestClass.create(title: "No m'agraden els pèsols", slug_es: "guisantes")
      }

      expect(thing.slug_es).to eq "no-m-agraden-els-pesols"
    end

    it "copies the current locale's slug into the other locales" do
      thing = I18n.with_locale(:en) { DummyTestClass.create(title: "I dislike peas") }

      expect(thing.slug_ca).to eq "i-dislike-peas"
      expect(thing.slug_es).to eq "i-dislike-peas"
    end

    it "extends the model with FriendlyId" do
      expect(DummyTestClass.singleton_class).to be < FriendlyId
    end

    describe "on a class that includes it at runtime" do
      let(:model) do
        stub_const("RuntimeThing", Class.new(ApplicationRecord) { self.table_name = "things" })
      end

      let(:slugged_model) do
        model.tap do |klass|
          klass.include(described_class)
          klass.friendly_id :title, use: [:slugged, :simple_i18n, :history]
        end
      end

      it "extends it with FriendlyId" do
        model.include(described_class)

        expect(model.singleton_class).to be < FriendlyId
      end

      it "gives it the slug reader" do
        model.include(described_class)

        expect(model.new).to respond_to(:slug)
      end

      it "installs the before_save that fills the other locales" do
        expect(slugged_model.create!(title: "Peas").slug_es).to eq "peas"
      end

      it "installs the lookup across the slug columns" do
        record = slugged_model.create!(title: "Peas")

        expect(slugged_model.find("peas")).to eq record
      end

      it "leaves a class that does not include it without FriendlyId" do
        expect(model.singleton_class).not_to be < FriendlyId
      end
    end
  end

  describe "#slug" do
    it "returns the slug of the current locale" do
      thing = DummyTestClass.create(title: "Peas", slug_en: "peas-en", slug_ca: "peas-ca")

      expect(I18n.with_locale(:en) { thing.slug }).to eq "peas-en"
    end

    it "falls back to the default locale when the current one has no slug" do
      thing = DummyTestClass.new(title: "Peas", slug_ca: "peas-ca")

      expect(I18n.with_locale(:en) { thing.slug }).to eq "peas-ca"
    end

    it "is nil when neither the current nor the default locale has a slug" do
      thing = DummyTestClass.new(title: "Peas")

      expect(I18n.with_locale(:en) { thing.slug }).to be_nil
    end
  end

  describe "#should_generate_new_friendly_id?" do
    it "is true when the friendly id base changed" do
      thing = DummyTestClass.new(title: "Peas")

      expect(thing.should_generate_new_friendly_id?).to be true
    end

    it "is false when the friendly id base is untouched" do
      thing = DummyTestClass.create(title: "Peas")

      expect(thing.should_generate_new_friendly_id?).to be false
    end

    it "is false when another attribute changed" do
      thing = DummyTestClass.create(title: "Peas")
      thing.slug_es = "guisantes"

      expect(thing.should_generate_new_friendly_id?).to be false
    end
  end

  describe ".find" do
    it "finds by the Catalan slug" do
      thing = DummyTestClass.create(title: "Pèsols", slug_es: "guisantes", slug_en: "peas")

      expect(DummyTestClass.find("pesols")).to eq thing
    end

    it "finds by the English slug" do
      thing = DummyTestClass.create(title: "Pèsols", slug_es: "guisantes", slug_en: "peas")

      expect(DummyTestClass.find("peas")).to eq thing
    end

    it "still finds by the primary key" do
      thing = DummyTestClass.create(title: "Pèsols")

      expect(DummyTestClass.find(thing.id)).to eq thing
    end

    it "raises when no record matches the slug" do
      expect { DummyTestClass.find("no-such-slug") }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    it "does not match a slug belonging to another record" do
      DummyTestClass.create(title: "Pèsols")
      other = DummyTestClass.create(title: "Cigrons")

      expect(DummyTestClass.find("cigrons")).to eq other
    end

    it "things with slugs in other languages" do
      thing = DummyTestClass.create(title: "No m'agraden els pèsols",
                                    slug_es: "no-me-gustan-los-guisantes")

      I18n.with_locale(:ca) do
        expect(DummyTestClass.find("no-me-gustan-los-guisantes")).to eq thing
      end
    end

    it "things with an old slug" do
      thing = DummyTestClass.create(title: "No m'agraden els pèsols")

      I18n.with_locale(:es) do
        thing.update!(title: "No me gustan los guisantes")
        thing.update!(title: "Tengo un poco de sueño")
      end

      I18n.with_locale(:ca) do
        expect(DummyTestClass.find("no-me-gustan-los-guisantes")).to eq thing
      end
    end
  end
end
