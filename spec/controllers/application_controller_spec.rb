# frozen_string_literal: true

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      render plain: ActiveStorage::Current.url_options.to_json
    end
  end

  before do
    routes.draw do
      get "anonymous", to: "anonymous#index"
      get ":locale/anonymous", to: "anonymous#index"
    end
  end

  describe "#set_locale" do
    it "serves a request that carries an available locale" do
      get :index, params: { locale: "ca" }

      expect(response).to have_http_status(:ok)
    end

    it "serves every available locale" do
      I18n.available_locales.each do |locale|
        get :index, params: { locale: locale.to_s }

        expect(response).to have_http_status(:ok)
      end
    end

    it "redirects a request with no locale to the default one" do
      get :index

      expect(response).to redirect_to "/ca/anonymous"
    end

    it "redirects a request whose locale is not available" do
      get :index, params: { locale: "de" }

      expect(response).to be_redirect
    end

    it "keeps the requested path when it redirects" do
      request.env["HTTP_ACCEPT_LANGUAGE"] = "es"
      get :index

      expect(response).to redirect_to "/es/anonymous"
    end
  end

  describe "#locale_from_headers" do
    it "uses the locale asked for in the Accept-Language header" do
      request.env["HTTP_ACCEPT_LANGUAGE"] = "en"
      get :index

      expect(response).to redirect_to "/en/anonymous"
    end

    it "honours the quality values in the header" do
      request.env["HTTP_ACCEPT_LANGUAGE"] = "en;q=0.2, es;q=0.9"
      get :index

      expect(response).to redirect_to "/es/anonymous"
    end

    it "falls back to the default locale for an unsupported language" do
      request.env["HTTP_ACCEPT_LANGUAGE"] = "de"
      get :index

      expect(response).to redirect_to "/ca/anonymous"
    end

    it "falls back to the default locale when there is no header" do
      get :index

      expect(response).to redirect_to "/ca/anonymous"
    end
  end

  describe "#set_tags" do
    it "exposes the tags of published works" do
      tag = create(:tag)
      create(:action_work, tags: [tag], published: true)

      get :index, params: { locale: "ca" }

      expect(assigns(:enabled_tags)).to eq [tag]
    end

    it "leaves out tags with no published work" do
      create(:tag)

      get :index, params: { locale: "ca" }

      expect(assigns(:enabled_tags)).to be_empty
    end

    it "preloads the tag name translations" do
      tag = create(:tag)
      create(:action_work, tags: [tag], published: true)

      get :index, params: { locale: "ca" }

      expect(assigns(:enabled_tags).first.association(:plain_text_translations)).to be_loaded
    end
  end

  describe "#current_user" do
    it "is nil with no session" do
      get :index, params: { locale: "ca" }

      expect(controller.send(:current_user)).to be_nil
    end

    it "is the user stored in the session" do
      user = create(:user)
      session[:user_id] = user.id

      get :index, params: { locale: "ca" }

      expect(controller.send(:current_user)).to eq user
    end

    # `set_current_user` asks on the way into every request, including the
    # public ones, so a session naming a deleted user has to read as anonymous
    # rather than raise — otherwise a stale cookie 500s the whole site.
    it "reads as signed out when the session points at a user that no longer exists" do
      session[:user_id] = 0

      get :index, params: { locale: "ca" }

      expect(response).to have_http_status(:ok)
      expect(controller.send(:current_user)).to be_nil
      expect(controller.send(:current_user?)).to be false
    end
  end

  describe "#set_current_user" do
    # `Current` is reset on the way out of the request, so the only place it
    # can be read back is from inside the action.
    controller do
      def index
        render plain: Current.user&.email.to_s
      end
    end

    it "leaves the models with nobody for an anonymous visitor" do
      get :index, params: { locale: "ca" }

      expect(response.body).to eq ""
    end

    it "hands the signed in user to the models" do
      user = create(:user)
      session[:user_id] = user.id

      get :index, params: { locale: "ca" }

      expect(response.body).to eq user.email
    end

    # Everything the later filters query is scoped by who is asking, so the
    # answer has to be in place before the first of them runs.
    it "runs before the filters that query" do
      filters = described_class._process_action_callbacks
                               .select { |callback| callback.kind == :before }
                               .map(&:filter)

      expect(filters.index(:set_current_user)).to be < filters.index(:set_tags)
    end
  end

  describe "#current_user?" do
    it "is false with no session" do
      get :index, params: { locale: "ca" }

      expect(controller.send(:current_user?)).to be false
    end

    it "is true when a user is signed in" do
      session[:user_id] = create(:user).id

      get :index, params: { locale: "ca" }

      expect(controller.send(:current_user?)).to be true
    end
  end

  describe "ActiveStorage urls" do
    it "points ActiveStorage at the requested host" do
      get :index, params: { locale: "ca" }

      expect(response.body).to eq({ host: "test.host" }.to_json)
    end
  end
end
