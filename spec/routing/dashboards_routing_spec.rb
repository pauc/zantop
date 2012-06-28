require "spec_helper"

describe DashboardsController do
  describe "routing" do

    it "routes to #front" do
      get("/").should route_to("dashboards#front")
    end
  end
end
