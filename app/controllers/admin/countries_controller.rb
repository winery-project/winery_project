class Admin::CountriesController < ApplicationController
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

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update(country_params)
      redirect_to admin_countries_path
    else
      render :edit
    end
  end

  def country_params
    params.require(:country).permit(:name, :flag_image)
  end
end
