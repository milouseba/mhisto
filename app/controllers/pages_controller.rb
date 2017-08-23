class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @exercices = policy_scope(Exercice).order(created_at: :desc)
  end
end
