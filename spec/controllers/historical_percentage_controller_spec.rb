require 'rails_helper'

RSpec.describe HistoricalPercentageController, type: :controller do
  let(:etf) { FactoryGirl.create :etf }
  let(:holding) { FactoryGirl.create :holding }
  let(:etf_holding) { FactoryGirl.create :etf_holding }
  let(:historical_percentage) { FactoryGirl.create :historical_percentage, percentage_date: Date.parse("2014-01-01") }
  let(:historical_percentage_2) { FactoryGirl.create :historical_percentage, percentage_date: Date.parse("2014-01-02") }

  before(:each) do
    etf
    holding
    etf_holding
    historical_percentage
    historical_percentage_2
  end

  describe "GET #index" do
    it "returns all historical percentages" do
      get :index, format: :json, etf_symbol: etf.name, holding_symbol: holding.name
      assert_response :success
      assert_equal 2, JSON.parse(response.body).length
    end

    it "returns all historical percentages inside a date range" do

    end
  end

end
