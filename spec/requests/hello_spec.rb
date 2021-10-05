require 'rails_helper'

RSpec.describe "Hellos", type: :request do
  describe "GET /world" do
    it "returns http success" do
      get "/hello/world"
      expect(response).to have_http_status(:success)
    end
  end

end
