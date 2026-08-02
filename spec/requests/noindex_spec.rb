# frozen_string_literal: true

# `config.x.noindex` marks a deployment that is not the real site — the
# provisional-domain rehearsal in docs/cutover-runbook.md. What has to hold is
# that it reaches the response of a request that never renders `<head>`, since
# the sitemap is the one URL a crawler is handed that lists every other.
#
# A request spec for the same reason sitemap_spec is one, and on the same route:
# an XML format never reaches `layouts/application.html.erb`, so nothing asks
# for the asset bundles CI does not build.
RSpec.describe "Noindex", type: :request do
  def robots_header
    response.headers["X-Robots-Tag"]
  end

  context "when the deployment is the real site" do
    it "says nothing about indexing" do
      get "/sitemap.xml"

      expect(robots_header).to be_nil
    end
  end

  context "when the deployment is not the real site" do
    before { allow(Rails.configuration.x).to receive(:noindex).and_return(true) }

    it "tells crawlers to index nothing it serves" do
      get "/sitemap.xml"

      expect(robots_header).to eq "noindex, nofollow"
    end

    # The header, not `Disallow: /`, precisely so the crawler still fetches the
    # page and reads it. A robots.txt that shipped the disallow would leave the
    # URL indexable from any link pointing at it.
    it "still serves the page it asks not to be indexed" do
      create(:visual_work, title: "Petra Perta")

      get "/sitemap.xml"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include "petra-perta"
    end
  end
end
