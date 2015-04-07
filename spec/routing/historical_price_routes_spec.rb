require 'rails_helper'

describe HistoricalPriceController do
  let(:holding) { FactoryGirl.create(:holding) }

  describe "routing" do
    it "routes to #index" do
      expect(get: "api/historical_price.json").to route_to(
        :controller => "historical_price",
        :action => "index",
        :format => "json"
      )
    end

    it "routes to #create" do
      expect(post: "api/historical_price.json").to route_to(
        :controller => "historical_price",
        :action => "create",
        :format => "json"
      )
    end

    it "routes to #update" do
      expect(put: "api/historical_price/1.json").to route_to(
        :controller => "historical_price",
        :action => "update",
        :format => "json", 
        :id => "1"
      )
    end

    it "routes to #destroy" do
      expect(delete: "api/historical_price/1.json").to route_to(
        :controller => "historical_price",
        :action => "destroy",
        :format => "json", 
        :id => "1"
      )
    end
  end
end