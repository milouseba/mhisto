class AnswersController < ApplicationController
  after_action :verify_authorized, :except => [:create, :index, :like, :update, :show]

  def index
    @answers = Answer.where(user_id: current_user.id)
    # @answers = policy_scope(Answer).where(user_id: current_user.id).order(created_at: :desc)
    # @exercices = Exercice.where(user_id: current_user.id)
    @exercices = policy_scope(Exercice).where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    set_exercice
    @answers = @exercice.answers
    @answer = Answer.find(params[:id])
  end

  def new

  end

  def create
    set_exercice
    @answer = Answer.new(answer_params)
    @answer.exercice = @exercice
    @answer.user = current_user
    @answer.status = "published" unless params[:publish].nil?
    if @answer.save
      redirect_to exercice_path(@exercice)
    else
      render "exercices/show"
    end
  end

  def update
    set_exercice
    @answer = Answer.find(params[:id])
    @answer.update(content: params[:answer][:content])
    @answer.update(status: "published") unless params[:publish].nil?
    redirect_to exercice_path(@exercice)
  end

  def publish
    set_exercice
    @answer = @exercice.answers.find_by_user_id(current_user.id)
    @answer.update(status: "published")
  end

  def like
    @answer = Answer.find(params[:id])
    @answer.liked_by current_user
    redirect_to exercice_path(@answer.exercice)
  end

  private
  def set_exercice
    @exercice = Exercice.find(params[:exercice_id])
  end

  def answer_params
    params.require(:answer).permit(:content, :user_id, :exercice_id)
  end
end
