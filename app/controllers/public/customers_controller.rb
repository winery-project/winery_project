class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "You have updated the user information successfully!"
      redirect_to customers_path
    else
      render :edit
    end
  end

  def confirm
  end

  def withdrawl
    customer = current_customer
    if customer.update(is_active: false)
      reset_session
      flash[:notice] = "You have withdrew successfully."
      redirect_to new_customer_registration_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :phone_number, :address)
  end

end
