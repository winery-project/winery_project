class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @Customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "You have updated the user information successfully!"
      redirect_to public_customers_show_path
    else
      render :edit
    end
  end

  def confirm
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :phone_number, :address)
  end

end
