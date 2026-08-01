# frozen_string_literal: true

RSpec.describe DashboardsController, type: :controller do
  describe "GET front" do
    it "renders" do
      get :front, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end

    it "renders the front template" do
      get :front, params: { locale: "en" }

      expect(response).to render_template(:front)
    end

    it "lists the published works" do
      work = create(:action_work, published: true)

      get :front, params: { locale: "en" }

      expect(assigns(:works)).to include work
    end

    it "leaves out unpublished works" do
      work = create(:action_work, published: false)

      get :front, params: { locale: "en" }

      expect(assigns(:works)).not_to include work
    end

    it "shows twelve works per page" do
      create_list(:action_work, 13, published: true)

      get :front, params: { locale: "en" }

      expect(assigns(:works).length).to eq 12
    end

    it "serves the second page" do
      create_list(:action_work, 13, published: true)

      get :front, params: { locale: "en", page: 2 }

      expect(assigns(:works).length).to eq 1
    end

    it "defaults to the first page" do
      create_list(:action_work, 13, published: true)

      get :front, params: { locale: "en" }

      expect(assigns(:works).current_page).to eq 1
    end

    it "preloads the plain text translations" do
      create(:action_work, published: true)

      get :front, params: { locale: "en" }

      expect(assigns(:works).first.association(:plain_text_translations)).to be_loaded
    end
  end

  describe "GET about" do
    it "renders" do
      get :about, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET more_works" do
    render_views

    it "renders the works partial" do
      create(:action_work, published: true)

      get :more_works, params: { locale: "en", page: 1 }

      expect(response).to render_template(partial: "_works")
    end

    it "renders only the works of the requested page" do
      create_list(:action_work, 13, published: true)

      get :more_works, params: { locale: "en", page: 2 }

      expect(response.body.scan("new-work").size).to eq 1
    end

    it "renders a full page of works for the first page" do
      create_list(:action_work, 13, published: true)

      get :more_works, params: { locale: "en", page: 1 }

      expect(response.body.scan("new-work").size).to eq 12
    end

    it "leaves out unpublished works" do
      work = create(:action_work, published: false, title: "Unpublished work")

      get :more_works, params: { locale: "en", page: 1 }

      expect(response.body).not_to include work.title
    end

    it "requires a page" do
      expect { get :more_works, params: { locale: "en" } }
        .to raise_error(KeyError)
    end
  end
end
