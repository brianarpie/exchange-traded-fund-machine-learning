require 'rails_helper'

RSpec.describe HoldingController, type: :controller do
  let(:holding) { FactoryGirl.create :holding, name: "PPP" }
  let(:holding_2) { FactoryGirl.create :holding, name: "OOO" }

  before(:each) do
    holding
    holding_2
  end

  describe "GET #index" do
    it "returns all holdings" do
      get :index, format: :json
      assert_response :success
      assert_equal 2, JSON.parse(response.body).length
    end
  end

  describe "POST #create" do
    it "creates a new holding" do
      expect { 
        post :create, format: :json,
          holding: { 
            name: "NEW" 
          }
      }.to change{ Holding.count }.from(2).to(3)
      
      assert_response :success
    end
  end

  describe "PUT #update" do
    it "updates the holding" do
      old_name = holding.name
      new_name = "CHNGD"
      
      expect {
        put :update, 
          format: :json, 
          id: holding.id, 
          holding: { name: new_name }
      }.to change{ 
        Holding.find(holding.id).name 
      }.from(old_name).to(new_name)

      assert_response :success
    end
  end

  describe "DELETE #destroy" do
    it "deletes the holding" do
      expect{
        delete :destroy, id: holding.id, format: :json
      }.to change{ Holding.count }.from(2).to(1)
    end
  end

  describe "GET #show" do
    it "returns the holding with the id passed" do
      get :show, id: holding.id, format: :json
      assert_response :success
      assert_equal holding.name, JSON.parse(response.body)['name']
      assert_equal holding.id, JSON.parse(response.body)['id']
    end
  end
end
