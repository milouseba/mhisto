class CommentsController < ApplicationController
  after_action :verify_authorized, :except => :create

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    set_answer
    @comment.answer = @answer
    @comment.user = current_user
    if @comment.save
      redirect_to exercice_path(@answer.exercice)
    else
      flash.now[:danger] = "error"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :answer_id)
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end
end
