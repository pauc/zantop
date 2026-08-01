# frozen_string_literal: true

RSpec.describe PagesController, type: :controller do
  describe "GET edit" do
    it "renders" do
      page = create(:page)

      get :edit, params: { locale: "ca", id: page.id }

      expect(response).to have_http_status(:ok)
    end

    it "renders the edit template" do
      page = create(:page)

      get :edit, params: { locale: "ca", id: page.id }

      expect(response).to render_template(:edit)
    end

    it "finds the page" do
      page = create(:page)

      get :edit, params: { locale: "ca", id: page.id }

      expect(assigns(:page)).to eq page
    end

    it "edits the contact page too" do
      page = create(:page, :contact)

      get :edit, params: { locale: "ca", id: page.id }

      expect(assigns(:page)).to eq page
    end

    it "raises when the page does not exist" do
      expect { get :edit, params: { locale: "ca", id: 999 } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "PATCH update" do
    it "saves the title" do
      page = create(:page)

      patch :update, params: { locale: "ca", id: page.id, page: { title: "Bio" } }

      expect(page.reload.title).to eq "Bio"
    end

    it "saves the body" do
      page = create(:page)

      patch :update, params: { locale: "ca", id: page.id, page: { body: "<p>Zigzagueja</p>" } }

      expect(page.reload.body.to_s).to include "Zigzagueja"
    end

    it "saves the title of the requested locale only" do
      page = create(:page)

      patch :update, params: { locale: "es", id: page.id, page: { title: "Bio" } }

      expect(I18n.with_locale(:ca) { page.reload.title }).to eq "About"
    end

    it "redirects the about page back to the about page" do
      page = create(:page)

      patch :update, params: { locale: "ca", id: page.id, page: { title: "Bio" } }

      expect(response).to redirect_to about_path
    end

    it "redirects the contact page back to the contact page" do
      page = create(:page, :contact)

      patch :update, params: { locale: "ca", id: page.id, page: { title: "Contacte" } }

      expect(response).to redirect_to contact_path
    end

    it "redirects within the requested locale" do
      page = create(:page)

      patch :update, params: { locale: "es", id: page.id, page: { title: "Bio" } }

      expect(response).to redirect_to "/es/bio"
    end

    it "confirms the update" do
      page = create(:page)

      patch :update, params: { locale: "en", id: page.id, page: { title: "Bio" } }

      expect(flash.notice).to eq "Content updated."
    end

    it "re-renders the form when the title is blank" do
      page = create(:page)

      patch :update, params: { locale: "ca", id: page.id, page: { title: "" } }

      expect(response).to render_template(:edit)
    end

    it "answers an invalid update with 422" do
      page = create(:page)

      patch :update, params: { locale: "ca", id: page.id, page: { title: "" } }

      expect(response).to have_http_status(:unprocessable_content)
    end

    it "keeps the stored title when the update is invalid" do
      page = create(:page)

      patch :update, params: { locale: "ca", id: page.id, page: { title: "" } }

      expect(page.reload.title).to eq "About"
    end

    it "rejects parameters outside the page key" do
      page = create(:page)

      expect { patch :update, params: { locale: "ca", id: page.id, title: "Bio" } }
        .to raise_error(ActionController::ParameterMissing)
    end
  end
end
