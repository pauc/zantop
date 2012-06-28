require "spec_helper"

describe DashboardsController do
  describe "routing" do

    it "routes to #front" do
      get("/").should route_to("dashboards#front")
    end

    it "routes to #about" do
      get("/about").should route_to("dashboards#about")
    end

    it "routes to #contact" do
      get("/contact").should route_to("dashboards#contact")
    end
  end
end
