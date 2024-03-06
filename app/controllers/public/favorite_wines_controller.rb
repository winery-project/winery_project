class Public::FavoriteWinesController < ApplicationController
  def create
    @favorite_wine = current_customer.favorite_wines.new(wine_id: params[:wine_id])
    @favorite_wine.save
    @wine = Wine.find(params[:wine_id])
  end

  def destroy
    @favorite_wine = current_customer.favorite_wines.find_by(wine_id: params[:wine_id])
    @favorite_wine.destroy
    @wine = Wine.find(params[:wine_id])
  end

  private

  def favorite_wine_params
    params.require(:favorite_wine).permit(:customer_id, :wine_id)
  end
end
