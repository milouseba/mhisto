class ExercicesController < ApplicationController

  def new
    @exercice = Exercice.new
    authorize @exercice
  end

  def create
    @exercice = Exercice.new(exercice_params)
    authorize @exercice
    @exercice.user = current_user
    if @exercice.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def exercice_params
    params.require(:exercice).permit(:title, :beginning_story, :end_story, :photo, :photo_cache)
  end

end
