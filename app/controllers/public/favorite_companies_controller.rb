class Public::FavoriteCompaniesController < ApplicationController
  def create
    @favorite_company = current_customer.favorite_companies.new(favorite_company_params)
    if @favorite_company.save
      redirect_back fallback_location: companies_path
    else
      redirect_back fallback_location: companies_path
    end
  end

  def destroy
    @favorite_company = current_customer.favorite_companies.find_by( company_id: params[:favorite_company][:company_id])
    @favorite_company.destroy
    redirect_back  fallback_location: companies_path
  end

  private

  def favorite_company_params
    params.require(:favorite_company).permit(:customer_id, :company_id)
  end
end
