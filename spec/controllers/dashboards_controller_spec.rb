# frozen_string_literal: true

require "rails_helper"

RSpec.describe DashboardsController, type: :controller do
  describe "GET home" do
    it do
      get :home, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET about" do
    it do
      get :about, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end
  end
end
