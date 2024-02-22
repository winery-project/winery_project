class Admin::CompaniesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_country, only: [:show, :edit, :update]

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

  def show; end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to admin_company_path(@company)
    else
      render :edit
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :introduction, :email, :phone_number, :is_active, :country_id, :logo_image)
  end
end
