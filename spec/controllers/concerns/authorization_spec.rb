# frozen_string_literal: true

RSpec.describe Authorization, type: :controller do
  controller(ApplicationController) do
    # `described_class` is an example group method, and this block is class_eval'd
    # on the anonymous controller, where it does not resolve.
    include Authorization # rubocop:disable RSpec/DescribedClass

    allow_anonymous :open

    def open
      head :ok
    end

    def closed
      head :ok
    end
  end

  before do
    routes.draw do
      get  ":locale/login",  to: "sessions#new", as: :login
      get  ":locale/open",   to: "anonymous#open"
      get  ":locale/closed", to: "anonymous#closed"
      post ":locale/closed", to: "anonymous#closed"
    end
  end

  describe "an action nobody opened" do
    it "turns an anonymous visitor away" do
      get :closed, params: { locale: "ca" }

      expect(response).to redirect_to login_path(locale: "ca")
    end

    it "says why" do
      get :closed, params: { locale: "ca" }

      expect(flash[:error]).to eq "Accés restringit. T'has d'identificar abans."
    end

    it "says why in the locale that was asked for" do
      get :closed, params: { locale: "en" }

      expect(flash[:error]).to eq "Restricted access. You need to log in first."
    end

    it "runs for a signed in user" do
      session[:user_id] = create(:user).id

      get :closed, params: { locale: "ca" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe "an action named in allow_anonymous" do
    it "serves an anonymous visitor" do
      get :open, params: { locale: "ca" }

      expect(response).to have_http_status(:ok)
    end

    it "serves a signed in user too" do
      session[:user_id] = create(:user).id

      get :open, params: { locale: "ca" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe "the location it remembers" do
    it "is the page the visitor was turned away from" do
      get :closed, params: { locale: "ca" }

      expect(session[:return_to]).to eq "/ca/closed"
    end

    it "keeps the query string, so a paginated page comes back paginated" do
      get :closed, params: { locale: "ca", page: "3" }

      expect(session[:return_to]).to eq "/ca/closed?page=3"
    end

    # A redirect can only issue a GET, so sending the visitor back to a form
    # post would replay it as a page request. There is nothing to remember.
    it "is left alone by a form post" do
      post :closed, params: { locale: "ca" }

      expect(session[:return_to]).to be_nil
    end

    it "is not written for a visitor who was let through" do
      session[:user_id] = create(:user).id

      get :closed, params: { locale: "ca" }

      expect(session[:return_to]).to be_nil
    end
  end

  describe "the list of open actions" do
    it "belongs to the controller that declared it" do
      expect(TagsController.anonymous_actions).to eq ["show"]
    end

    it "is not shared with a controller that declared its own" do
      expect(WorksController.anonymous_actions).to be_empty
    end

    it "cannot be widened from an instance" do
      expect(controller).not_to respond_to :anonymous_actions=
    end
  end
end
