require 'rails_helper'

RSpec.describe EtfController, type: :controller do
  let(:etf) { FactoryGirl.create :etf, name: "ZZZ" }
  let(:etf_2) { FactoryGirl.create :etf, name: "YYY" }

  before(:each) do
    etf
    etf_2
  end

  describe "GET #index" do
    it "returns all etfs" do
      get :index, format: :json
      assert_response :success
      assert_equal 2, JSON.parse(response.body).length
    end

    it "get a single etf by name" do
      get :index, format: :json, symbol: etf.name

      assert_response :success
      assert_equal 1, JSON.parse(response.body).length
    end
  end

  describe "POST #create" do
    it "creates a new etf" do
      expect { 
        post :create, format: :json,
          etf: {
            name: "CCC"
          }
      }.to change{ Etf.count }.from(2).to(3)
      
      assert_response :success
    end
  end

  describe "PUT #update" do
    it "updates the etf" do
      put :update, id: etf.id, format: :json, etf: { name: "NEW" }
      assert_response :success
      assert_equal "NEW", JSON(response.body)['name']
    end
  end

  describe "DELETE #destroy" do
    it "deletes the etf" do
      expect{
        delete :destroy, id: etf.id, format: :json
      }.to change{ Etf.count }.from(2).to(1)
    end
  end

  describe "GET #show" do
    it "returns the etf with the id passed" do
      get :show, id: etf.id, format: :json
      assert_response :success
      assert_equal etf.name, JSON.parse(response.body)['name']
      assert_equal etf.id, JSON.parse(response.body)['id']
    end
  end
end
