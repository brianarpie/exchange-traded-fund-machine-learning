require 'rails_helper'

RSpec.describe EtfController, type: :controller do
  let(:etf) { FactoryGirl.create(:etf) }

  describe "GET #index" do
    it "returns all etfs" do
      etf
      get :index, format: :json
      assert_response :success
      assert_equal 1, JSON.parse(response.body).length
    end
  end

  describe "POST #create" do
    it "creates a new etf" do
      post :create, name: "ABC", format: :json
      assert_response :success
      assert_equal "ABC", JSON.parse(response.body)['name']
    end
  end

  describe "PUT #update" do
    it "updates the etf" do
      etf
      put :update, id: etf.id, format: :json, etf: { name: "NEW" }
      assert_response :success
      assert_equal "NEW", JSON(response.body)['name']
    end
  end

  describe "DELETE #destroy" do
    it "deletes the etf" do
      etf
      expect{
        delete :destroy, id: etf.id, format: :json
      }.to change{ Etf.count }.from(1).to(0)
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
