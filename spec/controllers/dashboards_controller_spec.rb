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

    it "lists unpublished works for a signed in user" do
      sign_in
      work = create(:action_work, published: false)

      get :front, params: { locale: "en" }

      expect(assigns(:works)).to include work
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
      create(:page)

      get :about, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end

    it "assigns the about page" do
      page = create(:page)

      get :about, params: { locale: "en" }

      expect(assigns(:page)).to eq page
    end

    it "warns when the page is not translated into the requested locale" do
      I18n.with_locale(:ca) { create(:page) }

      get :about, params: { locale: "en" }

      expect(flash.now[:alert]).to eq "Oops! Sorry, this content is not translated into English."
    end

    it "stays quiet when the page is translated into the requested locale" do
      I18n.with_locale(:en) { create(:page) }

      get :about, params: { locale: "en" }

      expect(flash.now[:alert]).to be_nil
    end

    it "raises when the about page is missing" do
      expect { get :about, params: { locale: "en" } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "GET contact" do
    it "renders" do
      create(:page, :contact)

      get :contact, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end

    it "assigns the contact page the address is introduced by" do
      page = create(:page, :contact)

      get :contact, params: { locale: "en" }

      expect(assigns(:page)).to eq page
    end

    it "leaves the about page alone" do
      about = create(:page)
      create(:page, :contact)

      get :contact, params: { locale: "en" }

      expect(assigns(:page)).not_to eq about
    end

    it "raises when the contact page is missing" do
      expect { get :contact, params: { locale: "en" } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    # Unlike #about: the line naming the mailbox is a translation, so the page
    # still says what it is for even when the intro falls back to Catalan.
    it "stays quiet about a page that is not translated into the requested locale" do
      I18n.with_locale(:ca) { create(:page, :contact) }

      get :contact, params: { locale: "en" }

      expect(flash.now[:alert]).to be_nil
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

    it "renders unpublished works for a signed in user" do
      sign_in
      work = create(:action_work, published: false, title: "Unpublished work")

      get :more_works, params: { locale: "en", page: 1 }

      expect(response.body).to include work.title
    end

    it "requires a page" do
      expect { get :more_works, params: { locale: "en" } }
        .to raise_error(KeyError)
    end
  end
end
