class ExercicesController < ApplicationController

  def new
    @exercice = Exercice.new
    authorize @exercice
  end

  def product_params
    params.require(:exercice).permit(:title, :photo, :photo_cache)
  end

end
