# frozen_string_literal: true

RSpec.describe HeaderHelper do
  # The header is rendered by the layout, which no spec may render — see
  # CLAUDE.md — so the helper is exercised straight, standing where the layout
  # stands: after the template has declared what page this is.
  def visiting(controller:, action:, locale: "ca", record: nil, **rest, &)
    helper.controller.request.path_parameters.merge!(controller:, action:, locale:, **rest)
    helper.page_metadata(record:)

    I18n.with_locale(locale, &)
  end

  def selector(**)
    visiting(**) { Nokogiri::HTML5.fragment(helper.lang_selector) }
  end

  def index
    { controller: "visual_works", action: "index" }
  end

  describe "#lang_selector" do
    it "offers the three locales the site is published in" do
      expect(selector(**index).css("a").map(&:text)).to eq %w[cast cat eng]
    end

    # A `ul` may contain nothing but `li`. The separators used to be bare " | "
    # text nodes between the items, which is invalid and which a screen reader
    # reads out as punctuation between the languages.
    it "puts nothing but list items in the list" do
      expect(selector(**index).children.map(&:name)).to eq %w[li li li]
    end

    it "gives every item exactly one link" do
      expect(selector(**index).css("li").map { |item| item.css("a").size }).to eq [1, 1, 1]
    end

    it "names each language in that language, not in the one being read" do
      expect(selector(**index, locale: "en").css("a").pluck("aria-label"))
        .to eq %w[Castellano Català English]
    end

    # The name a speech-input user says has to contain what they can see.
    it "keeps the visible abbreviation inside the name it is given" do
      links = selector(**index).css("a")

      expect(links.all? { |link| link["aria-label"].downcase.include?(link.text) }).to be true
    end

    it "declares the language each link leads to" do
      expect(selector(**index).css("a").pluck("hreflang")).to eq %w[es ca en]
    end

    # So a screen reader pronounces "cast" as Spanish rather than as English.
    it "declares the language each link is written in" do
      expect(selector(**index).css("a").pluck("lang")).to eq %w[es ca en]
    end

    it "says which language is being read" do
      expect(selector(**index, locale: "es").css("[aria-current]").pluck("lang")).to eq ["es"]
    end

    it "marks it as the current page rather than as some other kind of current" do
      expect(selector(**index).css("a[lang=ca]").first["aria-current"]).to eq "page"
    end

    # The visual half of the same thing: `aria-current` alone would leave a
    # sighted visitor with three identical links.
    it "gives the current one a class to be styled by" do
      expect(selector(**index).css("a.current").map(&:text)).to eq ["cat"]
    end

    it "translates the path segments, not just the locale prefix" do
      expect(selector(**index).css("a").pluck("href"))
        .to eq %w[/es/arte-visual /ca/art-visual /en/visual-art]
    end

    # The slug is per-locale too. Linking to the current locale's slug under
    # another locale's prefix only resolves because the lookup matches any of
    # the three slug columns — which is a redirect waiting to be needed, not a
    # link. `page_metadata` already knows the record for the hreflang tags.
    it "links a work under the slug of the locale it points at" do
      work = create(:visual_work, title: "Procés in solid")
      I18n.with_locale(:en) { work.update!(title: "Petra Perta") }
      links = selector(controller: "visual_works", action: "show",
                       id: work.to_param, record: work)

      expect(links.css("a[lang=en]").first["href"]).to eq "/en/visual-art/petra-perta"
    end

    it "stays a path, so the links do not carry the host around" do
      links = selector(controller: "dashboards", action: "front").css("a")

      expect(links.pluck("href")).to all(start_with "/")
    end

    # Pages that declare no record — the indexes, the contact form — have only
    # a path to translate, and asking for a record's slug would be asking the
    # wrong question.
    it "translates a page that names no record" do
      links = selector(controller: "contact_messages", action: "new")

      expect(links.css("a[lang=es]").first["href"]).to eq "/es/contacto"
    end

    it "returns markup the header can print without making it safe itself" do
      expect(visiting(**index) { helper.lang_selector }).to be_html_safe
    end
  end
end
