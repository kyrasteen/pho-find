class Api::V1::FavoritesController < ApplicationController
  respond_to :json

  def index
    respond_with Favorite.all
  end

  def create
    respond_with :api, :v1, Favorite.create(favorite_params)
  end

  def destroy
    Favorite.delete(params[:id].to_i)
    head :ok
  end

  private

  def favorite_params
    params.require(:favorite).permit(:restaurant_id)
  end
end
