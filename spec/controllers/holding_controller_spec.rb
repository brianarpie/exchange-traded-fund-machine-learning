require 'rails_helper'

RSpec.describe HoldingController, type: :controller do
  let(:holding) { FactoryGirl.create(:holding) }

  describe "GET #index" do
    it "returns all holdings" do
      holding
      get :index, format: :json
      assert_response :success
      assert_equal 1, JSON.parse(response.body).length
    end
  end

  describe "POST #create" do
    it "creates a new holding" do
      post :create, name: "ABC", format: :json
      assert_response :success
      assert_equal "ABC", JSON.parse(response.body)['name']
    end
  end

  describe "PUT #update" do
    it "updates the holding" do
      holding
      put :update, id: holding.id, format: :json, holding: { name: "NEW" }
      assert_response :success
      assert_equal "NEW", JSON(response.body)['name']
    end
  end

  describe "DELETE #destroy" do
    it "deletes the holding" do
      holding
      expect{
        delete :destroy, id: holding.id, format: :json
      }.to change{ Holding.count }.from(1).to(0)
    end
  end

end
