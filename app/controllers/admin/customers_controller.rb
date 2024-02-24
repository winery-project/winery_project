class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.all
  end

  def show; end

  def edit; end

  def update
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer), notice: 'Successfully updated customer status'
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:is_active)
  end
end
