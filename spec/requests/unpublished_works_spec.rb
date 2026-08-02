# frozen_string_literal: true

# The controller specs cover which works each visitor is handed. What is left
# to check is what the real middleware stack does with the exception an
# anonymous request for a draft raises: a 404, the same answer a slug nobody
# ever used gets, and not a redirect — a redirect would confirm that the work
# is there and only being kept from them.
#
# Every example here therefore expects a 404, which Rails serves from
# `public/404.html`. None may expect a rendered page: the layout asks for asset
# bundles that CI does not build.
RSpec.describe "Unpublished works", type: :request do
  describe "a visual work" do
    let(:work) { create(:visual_work, published: false) }

    it "is not found by its slug" do
      get visual_work_path(work.to_param, locale: :ca)

      expect(response).to have_http_status(:not_found)
    end

    it "is not found by its id" do
      get visual_work_path(work.id, locale: :ca)

      expect(response).to have_http_status(:not_found)
    end

    it "answers the same way a work that never existed does" do
      get visual_work_path("no-such-work", locale: :ca)
      missing = response.status

      get visual_work_path(work.to_param, locale: :ca)

      expect(response.status).to eq missing
    end

    it "gives nothing of the work away" do
      get visual_work_path(work.to_param, locale: :ca)

      expect(response.body).not_to include work.title
    end
  end

  describe "an action work" do
    let(:work) { create(:action_work, published: false) }

    it "is not found by its slug" do
      get action_work_path(work.to_param, locale: :ca)

      expect(response).to have_http_status(:not_found)
    end

    it "is not found by its id" do
      get action_work_path(work.id, locale: :ca)

      expect(response).to have_http_status(:not_found)
    end
  end
end
