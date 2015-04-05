require 'rails_helper'

RSpec.describe HistoricalPriceController, type: :controller do
  let(:holding) { FactoryGirl.create(:holding) }
  let(:historical_price) { FactoryGirl.create :historical_price, price_date: Date.parse("2015-01-01") }
  let(:historical_price_2) { FactoryGirl.create :historical_price, price_date: Date.parse("2015-02-01") }

  describe "GET #index" do
    it "returns all historical prices" do
      holding
      historical_price
      historical_price_2

      get :index, format: :json, symbol: holding.name
      assert_response :success
      assert_equal 2, JSON.parse(response.body).length
    end

    it "returns all historical priecs inside a date range" do
      holding
      historical_price
      historical_price_2

      date = historical_price.price_date.strftime('%Y-%m-%d')

      get :index, format: :json, symbol: holding.name, start_date: date, end_date: date
      assert_response :success
      assert_equal 1, JSON.parse(response.body).length
    end
  end

  describe "POST #create" do
    it "creates a historical price" do
      holding
      historical_price
      historical_price_2

      expect {
        post :create, format: :json, historical_price: {
          price_date: Date.parse("1992-11-15"), 
          open: 1, close: 2, low: 0.5, high: 2.5, 
          priceable_id: holding.id, priceable_type: "Holding"
        }
      }.to change{ HistoricalPrice.count }.from(2).to(3)
      assert_response :success
    end
  end

  describe "PUT #update" do
    it "updates the historical_price -- a price attribute" do
      init_open = historical_price.open
      new_open = 0.05

      expect {
        put :update, id: historical_price.id, format: :json, 
        historical_price: { open: new_open }
      }.to change{ 
        HistoricalPrice.find(historical_price.id).open 
      }.from(init_open).to(new_open)

      assert_response :success
    end

    it "updates the historical_price -- :price_date" do
      init_price_date = historical_price.price_date
      new_price_date = Date.parse("200-01-01")

      expect {
        put :update, id: historical_price.id, format: :json, 
        historical_price: { price_date: new_price_date }
      }.to change{ 
        HistoricalPrice.find(historical_price.id).price_date 
      }.from(init_price_date).to(new_price_date)

      assert_response :success
    end
  end

  describe "DELETE #destroy" do
    it "deletes a historical price" do
      holding
      historical_price
      historical_price_2

      expect {
        delete :destroy, id: historical_price.id, format: :json
      }.to change{ HistoricalPrice.count }.from(2).to(1)
    end
  end

end
