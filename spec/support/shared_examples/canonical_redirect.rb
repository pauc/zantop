# frozen_string_literal: true

# `CanonicalRedirect` from the outside, which is the only place it is worth
# looking at it from: what it is for is the address in the browser bar and in
# a search index. Every controller that finds its record by slug runs these,
# so the concern cannot be included in one `show` and forgotten in the next.
#
# The including group provides `record`, saved and with a *different* slug in
# Catalan and in English — a record named the same in both is reached by one
# address in each locale and has nothing to be moved off. `url:` is the route
# helper the canonical address comes from, and `renamed_by:` the attribute a
# rename goes through, since renaming is what leaves a slug behind in
# friendly_id's history table.
RSpec.shared_examples "a page with one address per locale" do |url:, renamed_by:|
  it "renders under the slug belonging to the locale being viewed" do
    get :show, params: { locale: "ca", id: record.slug_ca }

    expect(response).to have_http_status(:ok)
  end

  it "moves a request under another locale's slug to this locale's" do
    get :show, params: { locale: "ca", id: record.slug_en }

    expect(response).to redirect_to public_send(url, locale: "ca", id: record.slug_ca)
  end

  it "moves it permanently, so the address it came from stops being indexed" do
    get :show, params: { locale: "ca", id: record.slug_en }

    expect(response).to have_http_status(:moved_permanently)
  end

  it "moves a request under a slug the record used to have" do
    former_slug = record.slug_ca
    record.update!(renamed_by => "Un altre nom")

    get :show, params: { locale: "ca", id: former_slug }

    expect(response).to redirect_to public_send(url, locale: "ca", id: record.reload.slug_ca)
  end

  # This is the admin's own path through the site: `update` redirects to the
  # work it just saved by id, since the slug it should be known by is the one
  # that save may have just changed.
  it "moves a request that names the record by its id" do
    get :show, params: { locale: "ca", id: record.id }

    expect(response).to redirect_to public_send(url, locale: "ca", id: record.slug_ca)
  end

  it "keeps the query string it was reached with" do
    get :show, params: { locale: "ca", id: record.slug_en, utm_source: "newsletter" }

    expect(response)
      .to redirect_to public_send(url, locale: "ca", id: record.slug_ca, utm_source: "newsletter")
  end
end
