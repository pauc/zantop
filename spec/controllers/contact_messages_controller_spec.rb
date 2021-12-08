require 'rails_helper'

RSpec.describe ContactMessagesController, type: :controller do
  describe "GET index" do
    it do
      get :new, params: { locale: "en" }

      expect(response).to have_http_status(:ok)
    end
  end
end
