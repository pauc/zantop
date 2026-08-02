# frozen_string_literal: true

RSpec.describe ActionWorksController, type: :controller do
  describe "GET index" do
    it "renders" do
      get :index, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end

    it "renders the shared works list" do
      get :index, params: { locale: "en" }

      expect(response).to render_template("works/works_list")
    end

    it "lists the action works" do
      work = create(:action_work)

      get :index, params: { locale: "en" }

      expect(assigns(:works)).to include work
    end

    it "leaves out visual works" do
      work = create(:visual_work)

      get :index, params: { locale: "en" }

      expect(assigns(:works)).not_to include work
    end

    it "preloads the translations" do
      create(:action_work)

      get :index, params: { locale: "en" }

      expect(assigns(:works).first.association(:plain_text_translations)).to be_loaded
    end

    it "leaves out unpublished works" do
      work = create(:action_work, published: false)

      get :index, params: { locale: "en" }

      expect(assigns(:works)).not_to include work
    end

    it "lists unpublished works for a signed in user" do
      sign_in
      work = create(:action_work, published: false)

      get :index, params: { locale: "en" }

      expect(assigns(:works)).to include work
    end
  end

  describe "GET show" do
    it "renders" do
      work = create(:action_work)

      get :show, params: { locale: "ca", id: work.to_param }

      expect(response).to have_http_status(:ok)
    end

    it "renders the shared show template" do
      work = create(:action_work)

      get :show, params: { locale: "ca", id: work.to_param }

      expect(response).to render_template("works/show")
    end

    it "finds the work by its slug" do
      work = create(:action_work)

      get :show, params: { locale: "ca", id: work.to_param }

      expect(assigns(:work)).to eq work
    end

    it "exposes the related works" do
      tag = create(:tag)
      work = create(:action_work, tags: [tag])
      related = create(:action_work, tags: [tag], published: true)

      get :show, params: { locale: "ca", id: work.to_param }

      expect(assigns(:related_works)).to include related
    end

    it "warns when the work is not translated into the current locale" do
      work = I18n.with_locale(:ca) { create(:action_work) }

      get :show, params: { locale: "en", id: work.to_param }

      expect(flash[:alert]).to eq I18n.t("untranslated_content", locale: :en)
    end

    it "does not warn when the work is translated into the current locale" do
      work = I18n.with_locale(:ca) { create(:action_work) }

      get :show, params: { locale: "ca", id: work.to_param }

      expect(flash[:alert]).to be_nil
    end

    it "raises when the work does not exist" do
      expect { get :show, params: { locale: "ca", id: "no-such-work" } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    # Raising, rather than redirecting: a redirect would tell an anonymous
    # visitor that the work is there and only being kept from them.
    it "raises for an unpublished work" do
      work = create(:action_work, published: false)

      expect { get :show, params: { locale: "ca", id: work.to_param } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    it "raises for an unpublished work asked for by its id" do
      work = create(:action_work, published: false)

      expect { get :show, params: { locale: "ca", id: work.id } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    it "serves an unpublished work to a signed in user" do
      sign_in
      work = create(:action_work, published: false)

      get :show, params: { locale: "ca", id: work.to_param }

      expect(assigns(:work)).to eq work
    end
  end

  describe "GET new" do
    before { sign_in }

    it "renders" do
      get :new, params: { locale: "ca" }

      expect(response).to have_http_status(:ok)
    end

    it "builds an empty form" do
      get :new, params: { locale: "ca" }

      expect(assigns(:work_form)).to be_a(ActionWorkForm).and be_new_record
    end
  end

  describe "GET edit" do
    before { sign_in }

    it "renders" do
      work = create(:action_work)

      get :edit, params: { locale: "ca", id: work.to_param }

      expect(response).to have_http_status(:ok)
    end

    it "fills the form with the work" do
      work = create(:action_work, title: "El títol")

      get :edit, params: { locale: "ca", id: work.to_param }

      expect(assigns(:work_form).title).to eq "El títol"
    end
  end

  describe "POST create" do
    before { sign_in }

    let(:valid_params) do
      { locale: "ca", action_work_form: { title: "Jurimuri", place: "Barcelona" } }
    end

    it "creates the work" do
      expect { post :create, params: valid_params }.to change(ActionWork, :count).by(1)
    end

    it "stores the permitted attributes" do
      post :create, params: valid_params

      expect(ActionWork.last.place).to eq "Barcelona"
    end

    it "redirects to the index" do
      post :create, params: valid_params

      expect(response).to redirect_to action_works_path
    end

    it "says the work was created" do
      post :create, params: valid_params

      expect(flash[:notice]).to eq I18n.t("created", locale: :ca)
    end

    it "re-renders the form when the work is invalid" do
      post :create, params: { locale: "ca", action_work_form: { title: "" } }

      expect(response).to render_template(:new)
    end

    it "does not create an invalid work" do
      expect { post :create, params: { locale: "ca", action_work_form: { title: "" } } }
        .not_to change(ActionWork, :count)
    end

    it "creates the tags given on the form" do
      params = { locale: "ca", action_work_form: { title: "Jurimuri", tags: ["escultura"] } }

      expect { post :create, params: }.to change(Tag, :count).by(1)
    end

    it "requires the form key" do
      expect { post :create, params: { locale: "ca" } }
        .to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "#action_work_params" do
    before { sign_in }

    def create_with(attributes)
      form = { title: "Jurimuri" }.merge(attributes)

      post :create, params: { locale: "ca", action_work_form: form }
    end

    it "permits the title" do
      create_with(title: "Un altre títol")

      expect(ActionWork.last.title).to eq "Un altre títol"
    end

    it "permits the description" do
      create_with(description: "La descripció")

      expect(ActionWork.last.description.to_plain_text).to eq "La descripció"
    end

    it "permits the place" do
      create_with(place: "Barcelona")

      expect(ActionWork.last.place).to eq "Barcelona"
    end

    it "permits the realization date" do
      create_with(realization_date: "1998-03-14")

      expect(ActionWork.last.realization_date).to eq Date.new(1998, 3, 14)
    end

    it "permits the published flag" do
      create_with(published: true)

      expect(ActionWork.last).to be_published
    end

    it "permits the tags" do
      create_with(tags: ["escultura"])

      expect(ActionWork.last.tags.map(&:name)).to eq ["escultura"]
    end

    it "permits the section title" do
      create_with(section_attributes: { "999999999999001" => { title: "Secció", body: "Cos" } })

      expect(Section.last.title).to eq "Secció"
    end

    it "permits the section body" do
      create_with(section_attributes: { "999999999999001" => { title: "Secció", body: "Cos" } })

      expect(Section.last.body.to_plain_text).to eq "Cos"
    end

    it "permits the section position" do
      create_with(section_attributes: {
                    "999999999999001" => { title: "Secció", body: "Cos", position: 3 }
                  })

      expect(Section.last.position).to eq 3
    end

    it "permits the image video url" do
      create_with(image_attributes: { "999999999999001" => { video: "https://vimeo.com/1" } })

      expect(Image.last.video).to eq "https://vimeo.com/1"
    end

    it "permits the image position" do
      create_with(image_attributes: {
                    "999999999999001" => { video: "https://vimeo.com/1", position: 2 }
                  })

      expect(Image.last.position).to eq 2
    end

    it "permits the image credits" do
      create_with(image_attributes: {
                    "999999999999001" => { video: "https://vimeo.com/1", credits: "Mireia" }
                  })

      expect(Image.last.credits).to eq "Mireia"
    end

    it "permits the section destroy flag" do
      work = create(:action_work)
      section = create(:section, work:)
      params = {
        locale: "ca",
        id: work.to_param,
        action_work_form: {
          title: work.title,
          section_attributes: { section.id.to_s => { _destroy: "true" } }
        }
      }

      expect { patch(:update, params:) }.to change(Section, :count).by(-1)
    end

    it "permits the image destroy flag" do
      work = create(:action_work)
      image = create(:image, :video, work:)
      params = {
        locale: "ca",
        id: work.to_param,
        action_work_form: {
          title: work.title,
          image_attributes: { image.id.to_s => { _destroy: "true" } }
        }
      }

      expect { patch(:update, params:) }.to change(Image, :count).by(-1)
    end
  end

  describe "PATCH update" do
    before { sign_in }

    it "updates the work" do
      work = create(:action_work, title: "Old")
      params = { locale: "ca", id: work.to_param, action_work_form: { title: "Nou títol" } }

      expect { patch :update, params: }.to change { work.reload.title }.from("Old").to("Nou títol")
    end

    it "redirects to the work" do
      work = create(:action_work)
      params = { locale: "ca", id: work.to_param, action_work_form: { title: "Nou títol" } }

      patch(:update, params:)

      expect(response).to redirect_to action_work_path(work.id)
    end

    it "says the work was updated" do
      work = create(:action_work)
      params = { locale: "ca", id: work.to_param, action_work_form: { title: "Nou títol" } }

      patch(:update, params:)

      expect(flash[:notice]).to eq I18n.t("updated", locale: :ca)
    end

    it "re-renders the form when the work is invalid" do
      work = create(:action_work)
      params = { locale: "ca", id: work.to_param, action_work_form: { title: "" } }

      patch(:update, params:)

      expect(response).to render_template(:edit)
    end

    it "leaves the work untouched when it is invalid" do
      work = create(:action_work, title: "Old")
      params = { locale: "ca", id: work.to_param, action_work_form: { title: "" } }

      expect { patch :update, params: }.not_to change { work.reload.title }
    end
  end

  describe "DELETE destroy" do
    before { sign_in }

    it "destroys the work" do
      work = create(:action_work)

      expect { delete :destroy, params: { locale: "ca", id: work.to_param } }
        .to change(ActionWork, :count)
        .by(-1)
    end

    it "redirects to the index" do
      work = create(:action_work)

      delete :destroy, params: { locale: "ca", id: work.to_param }

      expect(response).to redirect_to action_works_path
    end

    it "says the work was deleted" do
      work = create(:action_work)

      delete :destroy, params: { locale: "ca", id: work.to_param }

      expect(flash[:notice]).to eq I18n.t("deleted", locale: :ca)
    end

    it "raises when the work does not exist" do
      expect { delete :destroy, params: { locale: "ca", id: "no-such-work" } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
