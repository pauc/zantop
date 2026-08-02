# frozen_string_literal: true

RSpec.describe MetadataHelper do
  # The layout is what calls all of this, and no spec may render the layout:
  # `javascript_include_tag` needs bundles CI never builds. So the helper is
  # exercised straight, standing where the layout stands — after the template
  # has filled in its `content_for`s, with the request pointed at a route.
  def visiting(controller:, action:, locale: "ca", **rest)
    helper.controller.request.path_parameters.merge!(controller:, action:, locale:, **rest)
    # `Authorization` gives every controller that includes it this reader; the
    # bare test controller has none, which is what the noindex examples want.
    helper.controller.define_singleton_method(:anonymous_actions) { [action] }
  end

  def head
    helper.metadata_tags
  end

  describe "#document_title" do
    it "separates the page's own title from the site name" do
      helper.title("Art visual")

      expect(helper.document_title).to eq "Art visual | ZANTOP"
    end

    it "is the site name alone when the page set no title" do
      expect(helper.document_title).to eq "ZANTOP"
    end

    # `title` is fed by `page_title`, which strips the markup out of headings
    # like "Editar <span>Zenits</span>" but leaves whatever the admin typed.
    it "escapes the title rather than trusting it" do
      helper.title("Sant & Senyora")

      expect(helper.document_title).to eq "Sant &amp; Senyora | ZANTOP"
    end
  end

  describe "#localized_url" do
    it "translates the path segments, not just the locale prefix" do
      visiting(controller: "visual_works", action: "index")

      expect(helper.localized_url(:en)).to eq "http://test.host/en/visual-art"
      expect(helper.localized_url(:es)).to eq "http://test.host/es/arte-visual"
      expect(helper.localized_url(:ca)).to eq "http://test.host/ca/art-visual"
    end

    # The reason this cannot be a string substitution on the current path: the
    # slug is translated too, and a work is only reachable under the slug that
    # belongs to the locale being linked to.
    it "asks the record for the slug of the locale being linked to" do
      work = create(:visual_work, title: "Procés in solid")
      I18n.with_locale(:en) { work.update!(title: "Petra Perta") }
      visiting(controller: "visual_works", action: "show", id: work.to_param)

      expect(helper.localized_url(:en, work)).to eq "http://test.host/en/visual-art/petra-perta"
      expect(helper.localized_url(:ca, work)).to eq "http://test.host/ca/art-visual/proces-in-solid"
    end

    it "localizes a tag, whose route segment is not itself translated" do
      tag = create(:tag, name: "pintura")
      I18n.with_locale(:en) { tag.update!(name: "paintings") }
      visiting(controller: "tags", action: "show", id: tag.to_param)

      expect(helper.localized_url(:en, tag)).to eq "http://test.host/en/tags/paintings"
      expect(helper.localized_url(:ca, tag)).to eq "http://test.host/ca/tags/pintura"
    end

    it "localizes a route whose segment differs in only one locale" do
      visiting(controller: "dashboards", action: "about")

      expect(helper.alternate_urls.values)
        .to contain_exactly("http://test.host/ca/bio",
                            "http://test.host/es/bio",
                            "http://test.host/en/bio")
    end

    it "localizes the root, which has no segment of its own at all" do
      visiting(controller: "dashboards", action: "front")

      expect(helper.localized_url(:es)).to eq "http://test.host/es"
    end

    it "localizes a route that carries an id but no slug" do
      visiting(controller: "pages", action: "edit", id: "1")

      expect(helper.localized_url(:es)).to eq "http://test.host/es/paginas/1/edit"
    end

    # What the sitemap needs: it speaks about pages other than the one being
    # served, from a route that is not localized at all.
    it "localizes a page other than the one the request is on" do
      visiting(controller: "dashboards", action: "front")

      expect(helper.localized_url(:en, path_parameters: { controller: "contact_messages",
                                                          action: "new" }))
        .to eq "http://test.host/en/contact"
    end

    # The hreflang tags and the Open Graph URL are absolute because that is what
    # reads them; the language links in the header are the same URLs printed as
    # hrefs, and an href does not carry the host around.
    it "gives a path when the caller asks for one" do
      visiting(controller: "visual_works", action: "index")

      expect(helper.localized_url(:es, only_path: true)).to eq "/es/arte-visual"
    end

    it "keeps the record's own slug when it gives a path" do
      work = create(:visual_work, title: "Procés in solid")
      I18n.with_locale(:en) { work.update!(title: "Petra Perta") }
      visiting(controller: "visual_works", action: "show", id: work.to_param)

      expect(helper.localized_url(:en, work, only_path: true)).to eq "/en/visual-art/petra-perta"
    end
  end

  # The template names the record; the layout, which renders after it, is what
  # needs it for the language links.
  describe "#page_record" do
    it "is the record the page declared" do
      work = create(:visual_work)
      visiting(controller: "visual_works", action: "show", id: work.to_param)
      helper.page_metadata(record: work)

      expect(helper.page_record).to eq work
    end

    it "is nothing on a page that names no record" do
      visiting(controller: "contact_messages", action: "new")
      helper.page_metadata(description: "Escriu a Mireia Zantop.")

      expect(helper.page_record).to be_nil
    end
  end

  describe "#canonical_url" do
    # A work answers to any of its three slugs, so /es/arte-visual/<catalan
    # slug> renders rather than 404s. Only one of those URLs should be indexed.
    it "names the current locale's slug however the page was reached" do
      work = create(:action_work, title: "Tot Fluxus")
      I18n.with_locale(:en) { work.update!(title: "Flux Us") }
      visiting(controller: "action_works", action: "show", id: work.slug_ca, locale: "en")

      I18n.with_locale(:en) do
        expect(helper.canonical_url(work)).to eq "http://test.host/en/action-art/flux-us"
      end
    end
  end

  describe "#metadata_tags" do
    it "declares the canonical URL" do
      visiting(controller: "dashboards", action: "front")

      expect(head).to include %(<link rel="canonical" href="http://test.host/ca">)
    end

    it "declares an alternate for each locale" do
      visiting(controller: "action_works", action: "index")

      expect(head).to include %(<link rel="alternate" hreflang="ca" href="http://test.host/ca/art-daccio">)
      expect(head).to include %(<link rel="alternate" hreflang="es" href="http://test.host/es/arte-accion">)
      expect(head).to include %(<link rel="alternate" hreflang="en" href="http://test.host/en/action-art">)
    end

    # Without it a visitor whose browser asks for none of the three has no
    # nominated version, and `set_locale` would send them to Catalan anyway.
    it "points x-default at the site's own language" do
      visiting(controller: "action_works", action: "index")

      expect(head).to include %(<link rel="alternate" hreflang="x-default" href="http://test.host/ca/art-daccio">)
    end

    it "falls back to the site description when the page declared none" do
      visiting(controller: "dashboards", action: "front")
      site = ERB::Util.html_escape_once(I18n.t("meta.descriptions.site"))

      expect(head).to include %(<meta name="description" content="#{site}">)
    end

    it "falls back to the site image, so a shared link is never blank" do
      visiting(controller: "dashboards", action: "front")

      expect(head).to match %r{<meta property="og:image" content="http://test\.host/assets/MireiaZantop[^"]*">}
    end

    it "sends og:url to the same place as the canonical link" do
      visiting(controller: "dashboards", action: "about")

      expect(head).to include %(<meta property="og:url" content="http://test.host/ca/bio">)
    end

    it "names the locale being rendered" do
      visiting(controller: "dashboards", action: "about", locale: "es")

      I18n.with_locale(:es) do
        expect(head).to include %(<meta property="og:locale" content="es">)
      end
    end

    it "asks for the large card shape" do
      visiting(controller: "dashboards", action: "front")

      expect(head).to include %(<meta name="twitter:card" content="summary_large_image">)
    end

    it "titles the card with the page title, not the whole document title" do
      visiting(controller: "dashboards", action: "about")
      helper.title("Bio")

      expect(head).to include %(<meta property="og:title" content="Bio">)
    end

    it "titles the card with the site name when the page set no title" do
      visiting(controller: "dashboards", action: "front")

      expect(head).to include %(<meta property="og:title" content="ZANTOP">)
    end
  end

  describe "#metadata_tags on a page that is not public" do
    # robots.txt disallows fetching the admin area, which is not the same as
    # keeping it out of the index: a disallowed URL somebody links to gets
    # indexed unfetched, title and all.
    it "adds noindex to an action Authorization keeps closed" do
      helper.controller.request.path_parameters.merge!(controller: "works", action: "admin",
                                                       locale: "ca")

      expect(head).to include %(<meta name="robots" content="noindex, nofollow">)
    end

    it "leaves a public action indexable" do
      visiting(controller: "dashboards", action: "front")

      expect(head).not_to include "noindex"
    end
  end

  describe "#page_metadata" do
    it "takes the page's description over the site's" do
      visiting(controller: "contact_messages", action: "new")
      helper.page_metadata(description: "Escriu a Mireia Zantop.")

      expect(head).to include %(<meta name="description" content="Escriu a Mireia Zantop.">)
      expect(head).to include %(<meta property="og:description" content="Escriu a Mireia Zantop.">)
    end

    it "strips the markup out of a rich text description" do
      work = create(:action_work, description: "<p>Una <strong>acció</strong> compartida</p>")
      visiting(controller: "action_works", action: "show", id: work.to_param)
      helper.page_metadata(description: work.description)

      expect(head).to include %(content="Una acció compartida")
    end

    it "clamps a long description on a word boundary" do
      visiting(controller: "dashboards", action: "about")
      helper.page_metadata(description: "paraula " * 40)

      description = head[/name="description" content="([^"]*)"/, 1]

      expect(description.length).to be <= MetadataHelper::DESCRIPTION_LENGTH
      expect(description).to end_with "paraula..."
    end

    it "escapes a description exactly once" do
      visiting(controller: "dashboards", action: "about")
      helper.page_metadata(description: "Poesia & acció")

      expect(head).to include %(<meta name="description" content="Poesia &amp; acció">)
    end

    it "takes the work's own image as the card image" do
      work = create(:action_work, images: [build(:image)])
      visiting(controller: "action_works", action: "show", id: work.to_param)
      helper.page_metadata(image: work.first_image(:large))
      url = helper.rails_representation_url(work.first_image(:large))

      expect(head).to include %(<meta property="og:image" content="#{url}">)
    end

    it "marks a work as an article rather than a section of the site" do
      visiting(controller: "action_works", action: "show", id: "x")
      helper.page_metadata(type: "article")

      expect(head).to include %(<meta property="og:type" content="article">)
    end

    it "is a website by default" do
      visiting(controller: "dashboards", action: "about")
      helper.page_metadata(description: "Bio")

      expect(head).to include %(<meta property="og:type" content="website">)
    end

    # The template calls it once; a second call must replace what the first
    # said rather than emitting two of everything.
    it "replaces rather than appends when called twice" do
      visiting(controller: "dashboards", action: "about")
      helper.page_metadata(description: "First")
      helper.page_metadata(description: "Second")

      expect(head).to include %(<meta name="description" content="Second">)
      expect(head.scan("rel=\"canonical\"").size).to eq 1
    end
  end
end
