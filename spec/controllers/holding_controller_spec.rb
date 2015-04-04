require 'rails_helper'

RSpec.describe HoldingController, type: :controller do

  describe "GET #prices" do
    it "returns http success" do
      get :prices
      expect(response).to have_http_status(:success)
    end
  end

end
