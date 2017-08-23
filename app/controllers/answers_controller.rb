class AnswersController < ApplicationController
  after_action :verify_authorized, :except => [:create, :index]
  def index
    @answers = Answer.where(user_id: current_user.id)
    # @answers = policy_scope(Answer).where(user_id: current_user.id).order(created_at: :desc)
    # @exercices = Exercice.where(user_id: current_user.id)
    @exercices = policy_scope(Exercice).where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    # @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    set_exercice
    @answer.exercice = @exercice
    @answer.user = current_user
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
