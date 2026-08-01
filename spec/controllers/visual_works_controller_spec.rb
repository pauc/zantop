# frozen_string_literal: true

require "rails_helper"

RSpec.describe VisualWorksController, type: :controller do
  describe "GET index" do
    it "renders" do
      get :index, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end

    it "renders the shared works list" do
      get :index, params: { locale: "en" }

      expect(response).to render_template("works/works_list")
    end

    it "lists the visual works" do
      work = create(:visual_work)

      get :index, params: { locale: "en" }

      expect(assigns(:published_works)).to include work
    end

    it "leaves out action works" do
      work = create(:action_work)

      get :index, params: { locale: "en" }

      expect(assigns(:published_works)).not_to include work
    end

    it "preloads the translations" do
      create(:visual_work)

      get :index, params: { locale: "en" }

      expect(assigns(:published_works).first.association(:plain_text_translations)).to be_loaded
    end
  end

  describe "GET show" do
    it "renders" do
      work = create(:visual_work)

      get :show, params: { locale: "ca", id: work.to_param }

      expect(response).to have_http_status(:ok)
    end

    it "renders the shared show template" do
      work = create(:visual_work)

      get :show, params: { locale: "ca", id: work.to_param }

      expect(response).to render_template("works/show")
    end

    it "finds the work by its slug" do
      work = create(:visual_work)

      get :show, params: { locale: "ca", id: work.to_param }

      expect(assigns(:work)).to eq work
    end

    it "exposes the related works" do
      tag = create(:tag)
      work = create(:visual_work, tags: [tag])
      related = create(:visual_work, tags: [tag], published: true)

      get :show, params: { locale: "ca", id: work.to_param }

      expect(assigns(:related_works)).to include related
    end

    it "warns when the work is not translated into the current locale" do
      work = I18n.with_locale(:ca) { create(:visual_work) }

      get :show, params: { locale: "en", id: work.to_param }

      expect(flash[:alert]).to eq I18n.t("untranslated_content", locale: :en)
    end

    it "raises when the work does not exist" do
      expect { get :show, params: { locale: "ca", id: "no-such-work" } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "GET new" do
    it "renders" do
      get :new, params: { locale: "ca" }

      expect(response).to have_http_status(:ok)
    end

    it "builds an empty form" do
      get :new, params: { locale: "ca" }

      expect(assigns(:work_form)).to be_a(VisualWorkForm).and be_new_record
    end
  end

  describe "GET edit" do
    it "renders" do
      work = create(:visual_work)

      get :edit, params: { locale: "ca", id: work.to_param }

      expect(response).to have_http_status(:ok)
    end

    it "fills the form with the work" do
      work = create(:visual_work, title: "El títol")

      get :edit, params: { locale: "ca", id: work.to_param }

      expect(assigns(:work_form).title).to eq "El títol"
    end
  end

  describe "DELETE destroy" do
    it "destroys the work" do
      work = create(:visual_work)

      expect { delete :destroy, params: { locale: "ca", id: work.to_param } }
        .to change(VisualWork, :count)
        .by(-1)
    end

    it "redirects to the index" do
      work = create(:visual_work)

      delete :destroy, params: { locale: "ca", id: work.to_param }

      expect(response).to redirect_to visual_works_path
    end

    it "says the work was deleted" do
      work = create(:visual_work)

      delete :destroy, params: { locale: "ca", id: work.to_param }

      expect(flash[:notice]).to eq I18n.t("deleted", locale: :ca)
    end

    it "raises when the work does not exist" do
      expect { delete :destroy, params: { locale: "ca", id: "no-such-work" } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
