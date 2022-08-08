require 'rails_helper'

RSpec.describe "Members", type: :request do
  describe "GET /dashboard" do
    it "returns http success" do
      get "/members/dashboard"
      expect(response).to have_http_status(:success)
    end
  end

end
