require 'rails_helper'

describe "restaurant" do
  it "has valid attributes" do
    restaurant = Restaurant.create(name: "Pho Saigon", address: "someplace",
                                   phone: "3333333333", description: "awesome")
    expect(restaurant).to be_valid
  end
end

