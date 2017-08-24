class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to exercices_path if user_signed_in?
    @exercices = policy_scope(Exercice).order(created_at: :desc)
  end
end
