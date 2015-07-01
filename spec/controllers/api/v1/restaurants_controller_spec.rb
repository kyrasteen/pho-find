require 'rails_helper'

describe Api::V1::RestaurantsController do
  describe "#index" do
    it "returns all restaurants in Colorado" do
      Restaurant.create(name: "Pho Saigon", address: "somewhere", phone: "3333333333" )
      get :index, format: :json
      restaurants = JSON.parse(response.body, symbolize_names: true)
      expect(restaurants.count).to eq(1)
      expect(restaurants.first[:name]).to eq("Pho Saigon")
    end
  end
end
