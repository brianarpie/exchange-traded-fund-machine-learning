require 'rails_helper'

RSpec.describe EtfHoldingController, type: :controller do
  let(:etf) { FactoryGirl.create :etf, name: "ZZZ" }
  let(:etf_2) { FactoryGirl.create :etf, name: "YYY" }
  let(:holding) { FactoryGirl.create :holding }
  let(:etf_holding) { FactoryGirl.create :etf_holding, etf_id: etf.id, holding_id: holding.id }
  
  before(:each) do
    etf
    etf_2
    holding
    etf_holding
  end

  describe "GET #index" do
    it "returns all etf holdings" do
      get :index, format: :json
      assert_response :success
      assert_equal 1, JSON.parse(response.body).length
    end
  end

  describe "POST #create" do
    it "creates a new etf holding" do
      expect { 
        post :create, format: :json,
          etf_holding: {
            etf_id: etf_2.id,
            holding_id: holding.id
          }
      }.to change{ EtfHolding.count }.from(1).to(2)

      assert_response :success
    end
  end

  describe "PUT #update" do
    it "updates the etf holding" do
      old_etf_id = etf.id
      new_etf_id = etf_2.id
      expect { 
        put :update, 
          format: :json, 
          id: etf_holding.id, 
          etf_holding: { 
            etf_id: new_etf_id
          }
      }.to change{ 
        EtfHolding.find(etf_holding.id).etf_id 
      }.from(old_etf_id).to(new_etf_id)

      assert_response :success
    end
  end

  describe "DELETE #destroy" do
    it "deletes the etf holding" do
      expect{
        delete :destroy, id: etf_holding.id, format: :json
      }.to change{ EtfHolding.count }.from(1).to(0)
    end
  end

  describe "GET #show" do
    it "returns the etf holding with the id passed" do
      get :show, id: etf_holding.id, format: :json
      assert_response :success
      assert_equal etf_holding.id, JSON.parse(response.body)['id']
    end
  end
end
