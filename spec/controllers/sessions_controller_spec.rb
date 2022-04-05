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

      expect { get :destroy, params: { locale: :ca } }
        .to change(controller, :current_user)
        .from(user)
        .to(nil)
    end

    it "redirects to the front page" do
      expect(delete(:destroy, params: { locale: :ca })).to redirect_to("/ca")
    end
  end
end
