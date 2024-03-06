class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def index
    @orders = current_customer.orders.latest
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def new
    @order = current_customer.orders.new(order_params)
    @cart_items = current_customer.cart_items
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:delivery_option] == "0"
      @order.delivery_name = current_customer.last_name + current_customer.first_name
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
    elsif params[:order][:delivery_option] == "1"
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.delivery_name = @delivery.name
      @order.delivery_postal_code = @delivery.postal_code
      @order.delivery_address = @delivery.address
    end
    @cart_items = current_customer.cart_items
  end

  def create
    @order = current_customer.orders.new(order_params)
    if @order.save
      current_customer.cart_items.destroy_all
      redirect_to complete_orders_path
    else
      render :confirm
    end
  end

  def complete; end

  private

  def order_params
    params.require(:order).permit(:payment_method, :total_price, :shipping_cost, :delivery_name, :delivery_address, :delivery_postal_code)
  end
end
