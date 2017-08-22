class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def new
    # @answer = Answer.new
  end

  def create
    # raise
    @answer = Answer.new(answer_params)
    set_exercice
    @answer.exercice = @exercice
    if @answer.save
      redirect_to exercice_path(@exercice)
    else
      render "exercices/show"
    end
  end



  private
  def set_exercice
    @exercice = Exercice.find(params[:exercice_id])
  end

  def answer_params
    params.require(:answer).permit(:content, :user_id, :exercice_id)
  end
end
