class Admin::WinesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @wines = Wine.all
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.is_sold = true
    if @wine.save
      flash[:notice] = "You have created the wine successfully."
      redirect_to admin_wines_path
    else
      @wines = Wine.all
      render :new
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update(wine_params)
      flash[:notice] = "You have updated the wine successfully."
      redirect_to admin_wine_path(@wine.id)
    else
      render :edit
    end
  end

  def destroy
    wine = Wine.find(params[:id])
    if wine.destroy
      flash[:notice] = "You have deleted the wine successfully."
      redirect_to admin_wines_path
    else
      render :edit
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :introduction, :maturity, :fruity, :flavor, :bitter, :smooth, :aftertaste, :price, :genre_id, :company_id, :country_id, :genre_id, :is_sold)
  end

end
