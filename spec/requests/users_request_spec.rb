require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /info" do
    it "returns http success" do
      get "/users/info"
      expect(response).to have_http_status(:success)
    end
  end

end
