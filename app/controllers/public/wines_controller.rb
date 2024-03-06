class Public::WinesController < ApplicationController
  def index
    @wines = Wine.all
  end

  def show
    @wine = Wine.find(params[:id])
    @comments = @wine.wine_comments
    @comment = WineComment.new
    @cart_item = CartItem.new
  end
end
