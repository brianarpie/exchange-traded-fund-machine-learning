require 'rails_helper'

describe HistoricalPercentageController do
  let(:holding) { FactoryGirl.create(:holding) }

  describe "routing" do
    it "routes to #index" do
      expect(get: "api/historical_percentage.json").to route_to(
        :controller => "historical_percentage",
        :action => "index",
        :format => "json"
      )
    end

    it "routes to #create" do
      expect(post: "api/historical_percentage.json").to route_to(
        :controller => "historical_percentage",
        :action => "create",
        :format => "json"
      )
    end

    it "routes to #update" do
      expect(put: "api/historical_percentage/1.json").to route_to(
        :controller => "historical_percentage",
        :action => "update",
        :format => "json", 
        :id => "1"
      )
    end

    it "routes to #destroy" do
      expect(delete: "api/historical_percentage/1.json").to route_to(
        :controller => "historical_percentage",
        :action => "destroy",
        :format => "json", 
        :id => "1"
      )
    end
  end
end