require "spec_helper"

describe DashboardsController do
  describe "routing" do

    it "routes to #front" do
      get("/#{I18n.locale}").should route_to("dashboards#provisional", locale: I18n.locale.to_s)
      get("/ca").should route_to("dashboards#provisional", locale: "ca")
      get("/es").should route_to("dashboards#provisional", locale: "es")
      get("/en").should route_to("dashboards#provisional", locale: "en")
    end
  end
end
