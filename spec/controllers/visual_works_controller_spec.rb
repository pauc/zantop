# frozen_string_literal: true

require "rails_helper"

RSpec.describe VisualWorksController, type: :controller do
  describe "GET index" do
    it do
      get :index, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end
  end
end
