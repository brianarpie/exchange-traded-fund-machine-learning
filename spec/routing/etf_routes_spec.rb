require 'rails_helper'

describe EtfController do 
  let(:etf) { FactoryGirl.create(:etf) }

  describe "routing" do
    it "routes to #index" do
      expect(get: "api/etf.json").to route_to(
        :controller => "etf",
        :action => "index",
        :format => "json"
      )
    end

    it "routes to #create" do
      expect(post: "api/etf.json").to route_to(
        :controller => "etf",
        :action => "create",
        :format => "json"
      )
    end

    it "routes to #update" do
      expect(put: "api/etf/1.json").to route_to(
        :controller => "etf",
        :action => "update",
        :format => "json", 
        :id => "1"
      )
    end

    it "routes to #destroy" do
      expect(delete: "api/etf/1.json").to route_to(
        :controller => "etf",
        :action => "destroy",
        :format => "json", 
        :id => "1"
      )
    end

    it "routes to #show" do
      expect(get: "api/etf/1.json").to route_to(
        :controller => "etf",
        :action => "show",
        :format => "json", 
        :id => "1"
      )
    end
  end
end