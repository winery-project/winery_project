class Public::WineCommentsController < ApplicationController
  def create
    @wine = Wine.find(params[:wine_id])
    @comment = current_customer.wine_comments.new(wine_comment_params)
    @comment.wine_id = @wine.id
    if @comment.save
      flash[:notice] = "You have created comment successfully."
      @comments = @wine.wine_comments
    else
      @comments = @wine.wine_comments
    end
  end

  def destroy
    @wine = Wine.find(params[:wine_id])
    @comment = WineComment.find(params[:id])
    if @comment.destroy
      @comments = @wine.wine_comments
    else
      @comments = @wine.wine_comments
    end
  end

  private

  def wine_comment_params
    params.require(:wine_comment).permit(:comment)
  end
end
