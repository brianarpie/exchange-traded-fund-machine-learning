require 'rails_helper'

describe HoldingController do
  let(:holding) { FactoryGirl.create(:holding) }

  describe "routing" do
    it "routes to #index" do
      expect(get: "api/holding.json").to route_to(
        :controller => "holding",
        :action => "index",
        :format => "json"
      )
    end

    it "routes to #create" do
      expect(post: "api/holding.json").to route_to(
        :controller => "holding",
        :action => "create",
        :format => "json"
      )
    end

    it "routes to #update" do
      expect(put: "api/holding/1.json").to route_to(
        :controller => "holding",
        :action => "update",
        :format => "json", 
        :id => "1"
      )
    end

    it "routes to #destroy" do
      expect(delete: "api/holding/1.json").to route_to(
        :controller => "holding",
        :action => "destroy",
        :format => "json", 
        :id => "1"
      )
    end

    it "routes to #show" do
      expect(get: "api/holding/1.json").to route_to(
        :controller => "holding",
        :action => "show",
        :format => "json", 
        :id => "1"
      )
    end
  end
end