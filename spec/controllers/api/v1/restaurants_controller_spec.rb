require 'rails_helper'

describe Api::V1::RestaurantsController do
  describe "#index" do
    it "returns all restaurants in Colorado" do
      Restaurant.create(name: "Pho Saigon", address: "somewhere", phone: "3333333333" )
      Restaurant.create(name: "Pho 79", address: "somewhere", phone: "4444444444" )
      get :index, format: :json
      restaurants = JSON.parse(response.body, symbolize_names: true)
      expect(restaurants.count).to eq(2)
      expect(restaurants.first[:name]).to eq("Pho Saigon")
      expect(restaurants.last[:name]).to eq("Pho 79")
    end
  end

  describe "#show" do
    it "returns a single restaurant" do
      my_favorite_pho = Restaurant.create(name: "Pho Saigon", address: "somewhere", phone: "3333333333" )
      Restaurant.create(name: "Pho 79", address: "somewhere", phone: "4444444444" )
      get :show, format: :json, id: my_favorite_pho.id
      restaurants = JSON.parse(response.body, symbolize_names: true)
      expect(restaurants[:name]).to eq("Pho Saigon")
    end
  end

end
