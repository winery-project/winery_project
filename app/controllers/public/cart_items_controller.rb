class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: %i[update destroy increase decrease]

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    increase_or_create(params[:cart_item][:wine_id])
    redirect_to cart_items_path, notice: 'Successfully added wine to your cart'
  end


  def increase
    increase_or_create(@cart_item.wine.id)
    redirect_to request.referer, notice: 'Successfully added wine to your cart'
  end

  def decrease
    decrease_or_destroy(@cart_item.wine.id)
    redirect_to request.referer, notice: 'Successfully subtracted wine to your cart'
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referer, notice: 'Successfully deleted your one cart item'
  end

  private

  def set_cart_item
    @cart_item = current_customer.cart_items.find(params[:id])
  end

  def increase_or_create(wine_id)
    cart_item = current_customer.cart_items.find_by(wine_id:)
    if cart_item
      cart_item.increment!(:amount, 1)
    else
      current_customer.cart_items.build(wine_id:).save
    end
  end

  def decrease_or_destroy(wine_id)
    cart_item = current_customer.cart_items.find_by(wine_id:)
    if cart_item.amount > 1
      cart_item.decrement!(:amount, 1)
    else
      cart_item.destroy
    end
  end

  def cart_item_params
    params.require(:cart_item).permit(:wine_id)
  end
end

