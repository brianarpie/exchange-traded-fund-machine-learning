require 'rails_helper'

RSpec.describe HoldingController, type: :controller do
  let(:holding) { FactoryGirl.create(:holding) }
  let(:historical_price) { FactoryGirl.create(:historical_price) }

  describe "GET #prices" do
    it "returns http json success" do
      get :prices, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns all the historical prices" do
      holding
      historical_price

      get :prices, { id: holding.id, format: :json }

      assert_equal 1, JSON.parse(response.body).length
    end
  end

end
