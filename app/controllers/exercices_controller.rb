class ExercicesController < ApplicationController

  def index
    @exercices = policy_scope(Exercice).order(created_at: :desc)
    # authorize @exercices
  end

  def show
    set_exercice
    authorize @exercice
    @answers = Answer.where(exercice:@exercice)
    @answer = Answer.new
    @comments = Comment.where(answer:@answer)
    @comment = Comment.new
  end

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



    if @exercice.save
      respond_to do |format|
        format.html { redirect_to exercice_path }
        format.js  # <-- will render `app/views/exercices/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'exercices/' }
        format.js  # <-- idem
      end
    end














  end

  private

  def exercice_params
    params.require(:exercice).permit(:title, :beginning_story, :end_story, :photo, :photo_cache)
  end

  def set_exercice
    @exercice = Exercice.find(params[:id])
  end

end
