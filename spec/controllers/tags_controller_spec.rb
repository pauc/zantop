# frozen_string_literal: true

RSpec.describe TagsController, type: :controller do
  describe "GET show" do
    it "renders" do
      tag = create(:tag)

      get :show, params: { locale: "ca", id: tag.to_param }

      expect(response).to have_http_status(:ok)
    end

    it "finds the tag by its slug" do
      tag = create(:tag, name: "escultura")

      get :show, params: { locale: "ca", id: "escultura" }

      expect(assigns(:category)).to eq tag
    end

    it "lists the published works carrying the tag" do
      tag = create(:tag)
      work = create(:action_work, tags: [tag], published: true)

      get :show, params: { locale: "ca", id: tag.to_param }

      expect(assigns(:published_works)).to eq [work]
    end

    it "leaves out unpublished works" do
      tag = create(:tag)
      create(:action_work, tags: [tag], published: false)

      get :show, params: { locale: "ca", id: tag.to_param }

      expect(assigns(:published_works)).to be_empty
    end

    it "leaves out works carrying another tag" do
      tag = create(:tag)
      create(:action_work, tags: [create(:tag)], published: true)

      get :show, params: { locale: "ca", id: tag.to_param }

      expect(assigns(:published_works)).to be_empty
    end

    it "preloads the translations of the works" do
      tag = create(:tag)
      create(:action_work, tags: [tag], published: true)

      get :show, params: { locale: "ca", id: tag.to_param }

      expect(assigns(:published_works).first.association(:plain_text_translations)).to be_loaded
    end

    it "raises when the tag does not exist" do
      expect { get :show, params: { locale: "ca", id: "no-such-tag" } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "GET admin" do
    it "renders" do
      get :admin, params: { locale: "ca" }

      expect(response).to have_http_status(:ok)
    end

    it "lists every tag" do
      tag = create(:tag)

      get :admin, params: { locale: "ca" }

      expect(assigns(:categories)).to eq [tag]
    end

    it "lists tags with no works" do
      create(:tag)

      get :admin, params: { locale: "ca" }

      expect(assigns(:categories).length).to eq 1
    end

    it "preloads the name translations" do
      create(:tag)

      get :admin, params: { locale: "ca" }

      expect(assigns(:categories).first.association(:plain_text_translations)).to be_loaded
    end
  end

  describe "PATCH update" do
    it "updates the name in a single locale" do
      tag = create(:tag, name: "escultura")

      patch :update,
            params: { locale: "ca", id: tag.to_param, tag: { name: { es: "escultura es" } } }

      expect(I18n.with_locale(:es) { tag.reload.name }).to eq "escultura es"
    end

    it "updates the name in every locale at once" do
      tag = create(:tag, name: "escultura")
      names = { ca: "escultura ca", es: "escultura es", en: "sculpture" }

      patch :update, params: { locale: "ca", id: tag.to_param, tag: { name: names } }

      expect(%i[ca es en].map { |l| I18n.with_locale(l) { tag.reload.name } })
        .to eq ["escultura ca", "escultura es", "sculpture"]
    end

    it "leaves the locales given as blank alone" do
      tag = create(:tag, name: "escultura")

      patch :update, params: { locale: "ca", id: tag.to_param, tag: { name: { ca: "" } } }

      expect(I18n.with_locale(:ca) { tag.reload.name }).to eq "escultura"
    end

    it "does not blank out a locale left empty while another locale is updated" do
      tag = build(:tag)
      %i[ca es en].each { |l| I18n.with_locale(l) { tag.name = "escultura #{l}" } }
      tag.save!

      names = { ca: "nova ca", en: "", es: "nova es" }
      patch :update, params: { locale: "ca", id: tag.to_param, tag: { name: names } }

      expect(I18n.with_locale(:en) { tag.reload.name }).to eq "escultura en"
    end

    it "redirects to the tag admin page" do
      tag = create(:tag)

      patch :update, params: { locale: "ca", id: tag.to_param, tag: { name: { es: "nou" } } }

      expect(response).to redirect_to admin_tags_path
    end

    it "raises when the tag key is missing" do
      tag = create(:tag)

      expect { patch :update, params: { locale: "ca", id: tag.to_param } }
        .to raise_error(NoMethodError)
    end

    it "raises when the tag does not exist" do
      params = { locale: "ca", id: "no-such-tag", tag: { name: { es: "nou" } } }

      expect { patch :update, params: }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "DELETE destroy" do
    it "destroys the tag" do
      tag = create(:tag)

      expect { delete :destroy, params: { locale: "ca", id: tag.to_param } }
        .to change(Tag, :count)
        .by(-1)
    end

    it "redirects to the tag admin page" do
      tag = create(:tag)

      delete :destroy, params: { locale: "ca", id: tag.to_param }

      expect(response).to redirect_to admin_tags_path
    end

    it "says the tag was deleted" do
      tag = create(:tag)

      delete :destroy, params: { locale: "ca", id: tag.to_param }

      expect(flash[:notice]).to eq "Esborrat"
    end

    it "keeps the works that carried the tag" do
      tag = create(:tag)
      create(:action_work, tags: [tag])

      expect { delete :destroy, params: { locale: "ca", id: tag.to_param } }
        .not_to change(Work, :count)
    end

    it "raises when the tag does not exist" do
      expect { delete :destroy, params: { locale: "ca", id: "no-such-tag" } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "routing" do
    it "does not expose an index action" do
      expect { get :index, params: { locale: "ca" } }
        .to raise_error(ActionController::UrlGenerationError)
    end
  end
end
