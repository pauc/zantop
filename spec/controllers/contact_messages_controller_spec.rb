# frozen_string_literal: true

RSpec.describe ContactMessagesController, type: :controller do
  let(:valid_message) do
    {
      from_email: "example@example.com",
      from_name: "The name",
      subject: "The subject",
      text: "Some text"
    }
  end

  describe "GET new" do
    it "renders" do
      create(:page, :contact)

      get :new, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end

    it "builds an empty message" do
      create(:page, :contact)

      get :new, params: { locale: "en" }

      expect(assigns(:contact_message)).to be_a(ContactMessage)
      expect(assigns(:contact_message)).not_to be_persisted
    end

    it "assigns the contact page the form is introduced by" do
      page = create(:page, :contact)

      get :new, params: { locale: "en" }

      expect(assigns(:page)).to eq page
    end

    it "leaves the about page alone" do
      about = create(:page)
      create(:page, :contact)

      get :new, params: { locale: "en" }

      expect(assigns(:page)).not_to eq about
    end

    it "raises when the contact page is missing" do
      expect { get :new, params: { locale: "en" } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    it "stays quiet about a page that is not translated into the requested locale" do
      I18n.with_locale(:ca) { create(:page, :contact) }

      get :new, params: { locale: "en" }

      expect(flash.now[:alert]).to be_nil
    end
  end

  describe "POST create" do
    it "sends the message" do
      expect { post :create, params: { locale: "ca", contact_message: valid_message } }
        .to change { ActionMailer::Base.deliveries.size }
        .by(1)
    end

    it "sends it with the given subject" do
      post :create, params: { locale: "ca", contact_message: valid_message }

      expect(ActionMailer::Base.deliveries.last.subject)
        .to eq "[mireiazantop.com]: The subject"
    end

    it "redirects to the front page" do
      post :create, params: { locale: "ca", contact_message: valid_message }

      expect(response).to redirect_to root_path
    end

    it "confirms the message was sent" do
      post :create, params: { locale: "ca", contact_message: valid_message }

      expect(flash[:notice]).to eq I18n.t("contact_messages.create.confirmation", locale: :ca)
    end

    it "re-renders the form when the message is invalid" do
      create(:page, :contact)

      post :create, params: { locale: "ca", contact_message: valid_message.merge(text: "") }

      expect(response).to render_template(:new)
    end

    # The template it re-renders is the one #new sets the page up for, and this
    # action does not run #new.
    it "assigns the contact page again when the message is invalid" do
      page = create(:page, :contact)

      post :create, params: { locale: "ca", contact_message: valid_message.merge(text: "") }

      expect(assigns(:page)).to eq page
    end

    it "does not send an invalid message" do
      create(:page, :contact)

      expect {
        post :create, params: { locale: "ca", contact_message: valid_message.merge(text: "") }
      }.not_to change { ActionMailer::Base.deliveries.size }
    end

    it "rejects a malformed email address" do
      create(:page, :contact)
      params = { locale: "ca", contact_message: valid_message.merge(from_email: "not-an-email") }

      expect { post :create, params: }.not_to change { ActionMailer::Base.deliveries.size }
    end

    it "confirms in the locale the form was submitted in" do
      post :create, params: { locale: "en", contact_message: valid_message }

      expect(flash[:notice]).to eq I18n.t("contact_messages.create.confirmation", locale: :en)
      expect(flash[:notice]).not_to eq I18n.t("contact_messages.create.confirmation", locale: :ca)
    end

    it "confirms in Spanish for the Spanish form" do
      post :create, params: { locale: "es", contact_message: valid_message }

      expect(flash[:notice]).to eq I18n.t("contact_messages.create.confirmation", locale: :es)
      expect(flash[:notice]).not_to eq I18n.t("contact_messages.create.confirmation", locale: :ca)
    end

    describe "strong parameters" do
      it "ignores an attribute the form does not offer" do
        params = { locale: "ca", contact_message: valid_message.merge(persisted: "true") }

        expect { post :create, params: }
          .to change { ActionMailer::Base.deliveries.size }
          .by(1)
      end

      it "keeps the four attributes the form does offer" do
        post :create, params: { locale: "ca", contact_message: valid_message }

        expect(assigns(:contact_message).from_email).to eq "example@example.com"
        expect(assigns(:contact_message).from_name).to eq "The name"
        expect(assigns(:contact_message).subject).to eq "The subject"
        expect(assigns(:contact_message).text).to eq "Some text"
      end

      it "rejects a post with no message at all" do
        expect { post :create, params: { locale: "ca" } }
          .to raise_error(ActionController::ParameterMissing)
      end
    end
  end
end
