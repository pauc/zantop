# frozen_string_literal: true

RSpec.describe WorksController, type: :controller do
  describe "GET admin" do
    it "renders" do
      get :admin, params: { locale: "ca" }

      expect(response).to have_http_status(:ok)
    end

    it "lists the works with the highest position first" do
      oldest = create(:action_work, position: 1)
      newest = create(:visual_work, position: 2)

      get :admin, params: { locale: "ca" }

      expect(assigns(:works)).to eq [newest, oldest]
    end

    it "lists unpublished works too, so they can be ordered as well" do
      work = create(:action_work, published: false)

      get :admin, params: { locale: "ca" }

      expect(assigns(:works)).to eq [work]
    end

    it "preloads the translations the list marks each work against" do
      create(:action_work)

      get :admin, params: { locale: "ca" }

      work = assigns(:works).first

      expect(work.association(:plain_text_translations)).to be_loaded
      expect(work.association(:rich_text_translations)).to be_loaded
    end
  end

  describe "PATCH sort" do
    it "puts the works in the order they were sent" do
      first = create(:action_work, position: 1)
      second = create(:action_work, position: 2)

      patch :sort, params: { locale: "ca", work_ids: [first.id, second.id] }

      expect(Work.ordered).to eq [first, second]
    end

    it "answers with no content" do
      work = create(:action_work)

      patch :sort, params: { locale: "ca", work_ids: [work.id] }

      expect(response).to have_http_status(:no_content)
    end

    it "raises when no ids are sent" do
      expect { patch :sort, params: { locale: "ca" } }
        .to raise_error(ActionController::ParameterMissing)
    end
  end
end
