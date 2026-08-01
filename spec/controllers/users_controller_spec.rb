# frozen_string_literal: true

RSpec.describe UsersController, type: :controller do
  describe "GET edit" do
    it "renders the form for the signed in user" do
      sign_in create(:user)

      get :edit, params: { locale: "ca" }

      expect(response).to render_template(:edit)
    end

    it "edits the signed in user, since the route names nobody else" do
      user = create(:user)
      sign_in user

      get :edit, params: { locale: "ca" }

      expect(assigns(:user)).to eq user
    end

    it "sends anonymous visitors to the login form" do
      get :edit, params: { locale: "ca" }

      expect(response).to redirect_to login_path
    end
  end

  describe "PATCH update" do
    def change_password(password, confirmation: password)
      { locale: "ca",
        user: { password:, password_confirmation: confirmation } }
    end

    it "changes the password" do
      user = create(:user, password: "secret")
      sign_in user

      patch :update, params: change_password("newsecret")

      expect(user.reload.authenticate("newsecret")).to be_truthy
    end

    it "keeps the old password when the confirmation does not match" do
      user = create(:user, password: "secret")
      sign_in user

      patch :update, params: change_password("newsecret", confirmation: "mistyped")

      expect(user.reload.authenticate("secret")).to be_truthy
    end

    it "re-renders the form when the confirmation does not match" do
      sign_in create(:user)

      patch :update, params: change_password("newsecret", confirmation: "mistyped")

      expect(response).to render_template(:edit)
    end

    it "leaves the password alone when both fields are left blank" do
      user = create(:user, password: "secret")
      sign_in user

      patch :update, params: { locale: "ca", user: { name: "Mireia", password: "",
                                                     password_confirmation: "" } }

      expect(user.reload.authenticate("secret")).to be_truthy
    end

    it "updates the rest of the record" do
      user = create(:user)
      sign_in user

      patch :update, params: { locale: "ca", user: { name: "Mireia" } }

      expect(user.reload.name).to eq "Mireia"
    end

    it "redirects to the front page once the change is saved" do
      sign_in create(:user)

      patch :update, params: change_password("newsecret")

      expect(response).to redirect_to root_path
    end

    it "confirms the change" do
      sign_in create(:user)

      patch :update, params: change_password("newsecret")

      expect(flash[:notice]).to eq "Contingut actualitzat."
    end

    it "sends anonymous visitors to the login form" do
      patch :update, params: change_password("newsecret")

      expect(response).to redirect_to login_path
    end

    it "does not touch any user when nobody is signed in" do
      user = create(:user, password: "secret")

      patch :update, params: change_password("newsecret")

      expect(user.reload.authenticate("secret")).to be_truthy
    end

    it "requires the user key" do
      sign_in create(:user)

      expect { patch :update, params: { locale: "ca" } }
        .to raise_error(ActionController::ParameterMissing)
    end
  end
end
