require 'rails_helper'

describe EtfHoldingController do 
  let(:etf_holding) { FactoryGirl.create(:etf_holding) }

  describe "routing" do
    it "routes to #index" do
      expect(get: "api/etf_holding.json").to route_to(
        :controller => "etf_holding",
        :action => "index",
        :format => "json"
      )
    end

    it "routes to #create" do
      expect(post: "api/etf_holding.json").to route_to(
        :controller => "etf_holding",
        :action => "create",
        :format => "json"
      )
    end

    it "routes to #update" do
      expect(put: "api/etf_holding/1.json").to route_to(
        :controller => "etf_holding",
        :action => "update",
        :format => "json", 
        :id => "1"
      )
    end

    it "routes to #destroy" do
      expect(delete: "api/etf_holding/1.json").to route_to(
        :controller => "etf_holding",
        :action => "destroy",
        :format => "json", 
        :id => "1"
      )
    end

    it "routes to #show" do
      expect(get: "api/etf_holding/1.json").to route_to(
        :controller => "etf_holding",
        :action => "show",
        :format => "json", 
        :id => "1"
      )
    end
  end
end