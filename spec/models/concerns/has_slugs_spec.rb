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

  describe ".find" do
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
