# frozen_string_literal: true

RSpec.describe SessionsController, type: :controller do
  def credentials(email: "example@example.com", password: "secret")
    { locale: "ca", session: { email:, password: } }
  end

  describe "GET new" do
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

  describe "POST create" do
    it "authenticates the user" do
      user = create(:user, email: "example@example.com", password: "secret")

      expect { post :create, params: credentials }
        .to change(controller, :current_user)
        .from(nil)
        .to(user)
    end

    it "stores the user id in the session" do
      user = create(:user, email: "example@example.com", password: "secret")

      post :create, params: credentials

      expect(session[:user_id]).to eq user.id
    end

    it "redirects to the front page" do
      create(:user, email: "example@example.com", password: "secret")

      post :create, params: credentials

      expect(response).to redirect_to("/ca")
    end

    it "does not sign in a user whose credentials are invalid" do
      expect { post :create, params: credentials(email: "mac@mec.mic") }
        .not_to change(controller, :current_user)
        .from(nil)
    end

    it "shows an error message when the credentials are invalid" do
      post :create, params: credentials(email: "mac@mec.mic")

      expect(flash[:error]).to eq "Usuari o password incorrectes"
    end

    it "re-renders the login form when the credentials are invalid" do
      post :create, params: credentials(email: "mac@mec.mic")

      expect(response).to render_template(:new)
    end

    it "rejects a known email with the wrong password" do
      create(:user, email: "example@example.com", password: "secret")

      post :create, params: credentials(password: "wrong")

      expect(session[:user_id]).to be_nil
    end

    it "requires the session key" do
      expect { post :create, params: { locale: "ca" } }
        .to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "GET destroy" do
    it "logs out the current user" do
      user = create(:user)
      session[:user_id] = user.id

      expect { get :destroy, params: { locale: "ca" } }
        .to change(controller, :current_user)
        .from(user)
        .to(nil)
    end

    it "redirects to the front page" do
      get :destroy, params: { locale: "ca" }

      expect(response).to redirect_to("/ca")
    end

    it "clears the session even when nobody is signed in" do
      get :destroy, params: { locale: "ca" }

      expect(session[:user_id]).to be_nil
    end
  end
end
