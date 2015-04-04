require 'rails_helper'

RSpec.describe HoldingController, type: :controller do
  let(:holding) { FactoryGirl.create(:holding) }
  let(:historical_price) { FactoryGirl.create :historical_price, price_date: Date.parse("2015-01-01") }
  let(:historical_price_2) { FactoryGirl.create :historical_price, price_date: Date.parse("2015-02-01") }

  describe "GET #prices" do
    it "returns http success - format json" do
      get :prices, id: holding.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns http 500 error - no format" do
      get :prices, id: holding.id
      expect(response).to have_http_status(500)
    end

    it "raises ActiveRecord::RecordNotFound - no id or name specified" do
      expect { get :prices }.to raise_error
    end

    it "returns http success - name specified instead of id" do
      get :prices, ticker_symbol: holding.name, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns all the historical prices" do
      historical_price
      historical_price_2

      get :prices, id: holding.id, format: :json 
      assert_equal 2, JSON.parse(response.body).length
    end

    it "returns all the historical prices in a date range" do
      historical_price
      historical_price_2

      get :prices, id: holding.id,
           start_date: historical_price.price_date.strftime('%Y-%m-%d'), 
             end_date: historical_price.price_date.strftime('%Y-%m-%d'), 
               format: :json

      assert_equal 1, JSON.parse(response.body).length
    end
  end

end
