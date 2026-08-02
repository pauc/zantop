# frozen_string_literal: true

# A request spec rather than a controller one because the route is the point:
# it lives outside the `localized` block, so what has to be checked is that the
# real router and `set_locale` between them leave /sitemap.xml alone instead of
# bouncing it to /ca/sitemap.xml.
#
# Rendering the template is safe here where it is not elsewhere: an XML format
# never reaches `layouts/application.html.erb`, so nothing asks for the asset
# bundles CI does not build.
RSpec.describe "Sitemap", type: :request do
  def sitemap
    Nokogiri::XML(response.body).remove_namespaces!
  end

  def locations
    sitemap.xpath("//url/loc").map(&:text)
  end

  it "answers at the unprefixed path a crawler asks for" do
    get "/sitemap.xml"

    expect(response).to have_http_status(:ok)
    expect(response.media_type).to eq "application/xml"
  end

  it "is well-formed XML in the sitemap namespace" do
    create(:visual_work, title: "Petra Perta")
    create(:tag, name: "pintura").works << create(:action_work)

    get "/sitemap.xml"
    document = Nokogiri::XML(response.body)

    expect(document.errors).to be_empty
    expect(document.root.name).to eq "urlset"
    expect(document.root.namespace.href).to eq "http://www.sitemaps.org/schemas/sitemap/0.9"
  end

  it "is where robots.txt sends crawlers" do
    robots = Rails.public_path.join("robots.txt").read

    expect(robots).to include "Sitemap: https://mireiazantop.com#{sitemap_path(format: :xml)}"
  end

  it "gives every page one url per locale" do
    get "/sitemap.xml"

    expect(locations).to include "http://www.example.com/ca/bio",
                                 "http://www.example.com/es/bio",
                                 "http://www.example.com/en/bio"
  end

  it "names each locale's own slug, not the current one's under another prefix" do
    work = create(:visual_work, title: "Procés in solid")
    I18n.with_locale(:en) { work.update!(title: "Petra Perta") }

    get "/sitemap.xml"

    expect(locations).to include "http://www.example.com/ca/art-visual/proces-in-solid",
                                 "http://www.example.com/en/visual-art/petra-perta"
  end

  it "carries the alternates for all three locales plus x-default on each url" do
    get "/sitemap.xml"

    front = sitemap.xpath("//url[loc='http://www.example.com/es']")

    expect(front.xpath("link").map { |link| [link["hreflang"], link["href"]] })
      .to eq [["ca", "http://www.example.com/ca"],
              ["en", "http://www.example.com/en"],
              ["es", "http://www.example.com/es"],
              ["x-default", "http://www.example.com/ca"]]
  end

  it "leaves an unpublished work out" do
    create(:visual_work, title: "Esborrany", published: false)

    get "/sitemap.xml"

    expect(response.body).not_to include "esborrany"
  end

  # `Work.visible` would list it here and nowhere else, which is the worst
  # place for it: whatever proxy or crawler fetched the sitemap keeps the URL.
  it "leaves an unpublished work out for the signed in owner too" do
    create(:visual_work, title: "Esborrany", published: false)
    sign_in

    get "/sitemap.xml"

    expect(response.body).not_to include "esborrany"
  end
end
