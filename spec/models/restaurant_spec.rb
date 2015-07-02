require 'rails_helper'

describe "restaurant" do
  it "has valid attributes" do
    restaurant = Restaurant.create(name: "Pho Saigon", address: "someplace",
                                   phone: "3333333333", description: "awesome",
                                   image_url: "default.jpg")
    expect(restaurant).to be_valid
  end

  it "has many favorites" do
    restaurant = Restaurant.create(name: "Pho Saigon", address: "someplace",
                                   phone: "3333333333", description: "awesome",
                                   image_url: "default.jpg")
    favorite = restaurant.favorites.create(user_id:1)
    expect(favorite.restaurant).to eq(restaurant)
  end
end

