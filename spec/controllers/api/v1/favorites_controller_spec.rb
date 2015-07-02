require 'rails_helper'

describe Api::V1::FavoritesController do

  it "#index" do
    restaurant1 = Restaurant.create(name: "Pho Saigon", description: "yummy", address: "almost in Denver", phone: "5555555555")
    restaurant2 = Restaurant.create(name: "Pho Duy", description: "yummy", address: "almost in Denver", phone: "5555555555")
    restaurant3 = Restaurant.create(name: "Pho 79", description: "yummy", address: "almost in Denver", phone: "5555555555")
    user = User.create(bowtie_user_name: "betty")
    favorite = user.favorites.create(restaurant_id: restaurant1.id)
    user.favorites.create(restaurant_id: restaurant2.id)
    user.favorites.create(restaurant_id: restaurant3.id)
    get :index, format: :json, user_id: user.id
    favorites = JSON.parse(response.body, symbolize_names: true)
    expect(favorites.count).to eq(3)
    expect(favorites.first[:id]).to eq(favorite.id)
    expect(favorites.last[:restaurant_id]).to eq(restaurant3.id)
  end

  it "#create" do
    restaurant = Restaurant.create(name: "Pho Saigon", description: "yummy", address: "almost in Denver", phone: "5555555555")
    user = User.create(bowtie_user_name: "betty")
    post :create, format: :json, user_id: user.id, favorite: { restaurant_id: restaurant.id, user_id: user.id }
    data = JSON.parse(response.body)
    found_restaurant = Restaurant.find(data["restaurant_id"])
    expect(Restaurant.count).to eq(1)
    expect(found_restaurant).to eq(restaurant)
  end

  it "#destroy" do
    user = User.create(bowtie_user_name: "betty")
    restaurant = Restaurant.create(name: "Pho Saigon", description: "yummy", address: "almost in Denver", phone: "5555555555")
    favorite = user.favorites.create(restaurant_id: restaurant.id)
    expect(restaurant.favorites.count).to eq(1)
    delete :destroy, format: :json, user_id: user.id, id: favorite.id
    expect(user.favorites.count).to eq(0)
    expect(restaurant.favorites.count).to eq(0)
  end

end
