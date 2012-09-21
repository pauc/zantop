require "spec_helper"

describe DashboardsController do
  describe "routing" do

    it "routes to #front" do
      get("/#{I18n.locale}").should route_to("dashboards#provisional", locale: I18n.locale.to_s)
      get("/ca").should route_to("dashboards#provisional", locale: "ca")
      get("/es").should route_to("dashboards#provisional", locale: "es")
      get("/en").should route_to("dashboards#provisional", locale: "en")
    end

    it "routes to #about" do
      get("/#{I18n.locale}/about").should route_to("dashboards#about", locale: I18n.locale.to_s)
    end

    it "routes to #contact" do
      get("/#{I18n.locale}/contact").should route_to("dashboards#contact", locale: I18n.locale.to_s)
    end
  end
end
