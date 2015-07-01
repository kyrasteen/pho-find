require 'rails_helper'

describe Api::V1::FavoritesController do

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
    expect(Favorite.count).to eq(1)
    delete :destroy, format: :json, id: favorite.id
    expect(Favorite.count).to eq(0)
  end

end
