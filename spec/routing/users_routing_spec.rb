require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/#{I18n.locale}/users").should route_to("users#index", locale: I18n.locale.to_s)
    end

    it "routes to #new" do
      get("/#{I18n.locale}/users/new").should route_to("users#new", locale: I18n.locale.to_s)
    end

    it "routes to #show" do
      get("/#{I18n.locale}/users/1").should route_to("users#show", id: "1", locale: I18n.locale.to_s)
    end

    it "routes to #edit" do
      get("/#{I18n.locale}/users/1/edit").should route_to("users#edit", id: "1", locale: I18n.locale.to_s)
    end

    it "routes to #create" do
      post("/#{I18n.locale}/users").should route_to("users#create", locale: I18n.locale.to_s)
    end

    it "routes to #update" do
      put("/#{I18n.locale}/users/1").should route_to("users#update", id: "1", locale: I18n.locale.to_s)
    end

    it "routes to #destroy" do
      delete("/#{I18n.locale}/users/1").should route_to("users#destroy", id: "1", locale: I18n.locale.to_s)
    end
  end
end
