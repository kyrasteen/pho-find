class Api::V1::FavoritesController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.favorites.all
  end

  def create
    respond_with :api, :v1, current_user.favorites.create(favorite_params)
  end

  def destroy
    Favorite.delete(params[:id].to_i)
    head :ok
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :restaurant_id)
  end
end
