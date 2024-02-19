class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @user = current_customer
  end

  def edit
  end

  def confirm
  end
end
