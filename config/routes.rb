Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :exercices, only: [:index, :show, :new, :create] do
    resources :answers, only: [:create]
  end

  resources :answers, only: [:index]
end
