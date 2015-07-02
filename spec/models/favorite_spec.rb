require 'rails_helper'

describe "favorites" do
  it "belongs to a restaurant" do
    restaurant = Restaurant.create(name: "Pho Magic", description: "pho all day", address: "denver", phone: "9999999999")
    favorite = restaurant.favorites.create(user_id: 1)
    expect(favorite.restaurant).to eq(restaurant)
  end

  it "belongs to a user" do
    user = User.create(bowtie_user_id: "23412341234", bowtie_user_name: "betty", bowtie_user_email: "betty@example.com")
    favorite = user.favorites.create(restaurant_id: 1)
    expect(favorite.user).to eq(user)
  end
end
