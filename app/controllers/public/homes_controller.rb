class Public::HomesController < ApplicationController
  def top
    @wines = Wine.all
  end

  def about
  end
end
