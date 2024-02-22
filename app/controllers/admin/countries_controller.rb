class Admin::CountriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_country, only: [:edit, :update]

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to admin_countries_path
    else
      render :index
    end
  end

  def index
    @country = Country.new
    @countries = Country.all
  end

  def edit; end

  def update
    if @country.update(country_params)
      redirect_to admin_countries_path
    else
      render :edit
    end
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :flag_image)
  end
end
