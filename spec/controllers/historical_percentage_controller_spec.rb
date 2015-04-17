require 'rails_helper'

RSpec.describe HistoricalPercentageController, type: :controller do
  let(:etf) { FactoryGirl.create :etf }
  let(:holding) { FactoryGirl.create :holding }
  let(:etf_holding) { FactoryGirl.create :etf_holding, etf_id: etf.id, holding_id: holding.id }
  let(:historical_percentage) { FactoryGirl.create :historical_percentage, percentage_date: Date.parse("2014-01-01"), etf_holding_id: etf_holding.id }
  let(:historical_percentage_2) { FactoryGirl.create :historical_percentage, percentage_date: Date.parse("2014-01-02"), etf_holding_id: etf_holding.id }

  before(:each) do
    etf
    holding
    etf_holding
    historical_percentage
    historical_percentage_2
  end

  describe "GET #index" do
    it "returns all historical percentages" do
      get :index, 
        format:         :json, 
        holding_symbol: holding.name,
        etf_symbol:     etf.name 

      assert_response :success
      assert_equal 2, JSON.parse(response.body).length
    end

    it "returns all historical percentages inside a date range" do
      date = historical_percentage.percentage_date.strftime('%Y-%m-%d')

      get :index, 
        format:         :json, 
        etf_symbol:     etf.name, 
        holding_symbol: holding.name, 
        start_date:     date, 
        end_date:       date

      assert_response :success
      assert_equal 1, JSON.parse(response.body).length
    end
  end

  describe "POST #create" do
    it "creates a historical percentage" do
      expect {
        post :create, 
          format: :json, 
          historical_percentage: {
            etf_holding_id: etf_holding.id,
            percentage_date: Date.parse("2001-9-11")
          }
      }.to change{ HistoricalPercentage.count }.from(2).to(3)

      assert_response :success
    end
  end

  describe "PUT #update" do
    it "updates the historical_percentage attributes" do
      old_date = historical_percentage.percentage_date
      new_date = Date.parse("2015-4-16")

      expect {
        put :update, format: :json, 
          id: historical_percentage.id,
          historical_percentage: {
            percentage_date: new_date
          }
      }.to change { 
        HistoricalPercentage.find(historical_percentage.id).percentage_date 
      }.from(old_date).to(new_date)

      assert_response :success
    end
  end

  describe "DELETE #destroy" do
    it "deletes a historical percentage" do
      expect {
        delete :destroy, id: historical_percentage.id, format: :json
      }.to change{ HistoricalPercentage.count }.from(2).to(1)

      assert_response :success
    end
  end
end
