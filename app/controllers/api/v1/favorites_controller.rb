class Api::V1::FavoritesController < ApplicationController
  respond_to :json

  def create
    respond_with :api, :v1, Favorite.create(favorite_params)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:restaurant_id)
  end
end
