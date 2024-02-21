class Admin::CompaniesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to admin_company_path(@company)
    else
      render :new
    end
  end


  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to admin_company_path(@company)
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :introduction, :email, :phone_number, :is_active, :country_id, :logo_image)
  end
end
