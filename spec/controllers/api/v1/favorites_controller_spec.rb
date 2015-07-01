require 'rails_helper'

describe Api::V1::FavoritesController do

  it "#index" do
    restaurant = Restaurant.create(name: "Pho Saigon", description: "yummy", address: "almost in Denver", phone: "5555555555")
    favorite1 = restaurant.favorites.create
    favorite2 = restaurant.favorites.create
    favorite3 = restaurant.favorites.create
    get :index, format: :json
    favorites = JSON.parse(response.body, symbolize_names: true)
    expect(favorites.count).to eq(3)
    expect(favorites.first[:id]).to eq(favorite1.id)
    expect(favorites[1][:id]).to eq(favorite2.id)
    expect(favorites.last[:id]).to eq(favorite3.id)
  end

  it "#create" do
    restaurant = Restaurant.create(name: "Pho Saigon", description: "yummy", address: "almost in Denver", phone: "5555555555")
    post :create, format: :json, favorite: {restaurant_id: restaurant.id}
    data = JSON.parse(response.body)
    found_restaurant = Restaurant.find(data["restaurant_id"])
    expect(Restaurant.count).to eq(1)
    expect(found_restaurant).to eq(restaurant)
  end

  it "#destroy" do
    restaurant = Restaurant.create(name: "Pho Saigon", description: "yummy", address: "almost in Denver", phone: "5555555555")
    favorite = restaurant.favorites.create
    expect(restaurant.favorites.count).to eq(1)
    delete :destroy, format: :json, id: favorite.id
    expect(restaurant.favorites.count).to eq(0)
  end

end
