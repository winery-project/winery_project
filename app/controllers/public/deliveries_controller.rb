class Public::DeliveriesController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_delivery, only: %i[edit update]

  def index
    @deliveries = current_customer.deliveries.latest
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = current_customer.deliveries.new(delivery_params)
    if @delivery.save
      redirect_to deliveries_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @delivery.update(delivery_params)
    redirect_to deliveries_path, notice: 'Successfully updated delivery'
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(%i[name postal_code address])
  end
end

