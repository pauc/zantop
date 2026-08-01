# frozen_string_literal: true

require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "#create" do
    it "authenticates the user" do
      user = User.create!(email: "example@example.com", password: "secret")

      params = {
        locale: "ca",
        session: {
          email: "example@example.com",
          password: "secret"
        }
      }

      expect { post(:create, params:) }
        .to change(controller, :current_user)
        .from(nil)
        .to(user)
    end

    it "redirects to the front page" do
      User.create!(email: "example@example.com", password: "secret")

      params = {
        locale: "ca",
        session: {
          email: "example@example.com",
          password: "secret"
        }
      }

      post(:create, params:)

      expect(response).to redirect_to("/ca")
    end

    it "shows an error message if the credentials are invalid" do
      params = {
        locale: "ca",
        session: {
          email: "mac@mec.mic",
          password: "secret"
        }
      }

      post(:create, params:)

      expect(flash[:error]).to eq "Usuari o password incorrectes"
    end

    it "doesn't sign in the user if the credentials are invalid" do
      params = {
        locale: "ca",
        session: {
          email: "mac@mec.mic",
          password: "secret"
        }
      }

      expect { post(:create, params:) }
        .not_to change(controller, :current_user)
        .from(nil)
    end
  end

  describe "#destroy" do
    it "logs out the current user" do
      user = User.create!(email: "example@example.com", password: "secret")

      session[:user_id] = user.id

      expect { get :destroy, params: { locale: "ca" } }
        .to change(controller, :current_user)
        .from(user)
        .to(nil)
    end

    it "redirects to the front page" do
      expect(delete(:destroy, params: { locale: "ca" })).to redirect_to("/ca")
    end

    it "clears the session even when nobody is signed in" do
      delete :destroy, params: { locale: "ca" }

      expect(session[:user_id]).to be_nil
    end
  end

  describe "#new" do
    it "renders the login form when nobody is signed in" do
      get :new, params: { locale: "ca" }

      expect(response).to render_template(:new)
    end

    it "greets a user who is already signed in" do
      user = create(:user, name: "Mireia")
      session[:user_id] = user.id

      get :new, params: { locale: "ca" }

      expect(flash[:notice]).to eq "Hola Mireia, ja estàs autenticada"
    end

    it "sends a signed in user back where they came from" do
      session[:user_id] = create(:user).id
      request.env["HTTP_REFERER"] = "/ca/action_works"

      get :new, params: { locale: "ca" }

      expect(response).to redirect_to "/ca/action_works"
    end

    it "sends a signed in user to the root when there is no referer" do
      session[:user_id] = create(:user).id

      get :new, params: { locale: "ca" }

      expect(response).to redirect_to root_path
    end
  end

  describe "#create session state" do
    it "stores the user id in the session" do
      user = create(:user, email: "example@example.com", password: "secret")
      params = { locale: "ca", session: { email: "example@example.com", password: "secret" } }

      post(:create, params:)

      expect(session[:user_id]).to eq user.id
    end

    it "rejects a valid email with the wrong password" do
      create(:user, email: "example@example.com", password: "secret")
      params = { locale: "ca", session: { email: "example@example.com", password: "wrong" } }

      post(:create, params:)

      expect(session[:user_id]).to be_nil
    end

    it "re-renders the login form when the credentials are invalid" do
      params = { locale: "ca", session: { email: "mac@mec.mic", password: "secret" } }

      post(:create, params:)

      expect(response).to render_template(:new)
    end

    it "requires the session key" do
      expect { post :create, params: { locale: "ca" } }
        .to raise_error(ActionController::ParameterMissing)
    end
  end
end
