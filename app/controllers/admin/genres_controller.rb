class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, only: [:edit, :update, :destroy]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "You have created the genre successfully."
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit; end

  def update
    if @genre.update(genre_params)
      flash[:notice] = "You have updated the genre successfully."
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  def destroy
    if genre.destroy
      flash[:notice] = "You have deleted the genre successfully."
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
