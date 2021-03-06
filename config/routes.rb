Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

    root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :exercices, only: [:index, :show, :new, :create] do
    resources :answers, only: [:create, :update, :show]
    get 'publish', to: 'answers#publish'
  end

  resources :answers, only: [] do
    resources :comments, only: [:create]
  end
  get '/answers/:id/like', to: 'answers#like', as: 'answers_like'

  resources :answers, only: [:index]

  # get 'answer/user_id/edit', to: 'users#edit', as: 'edit_user'

  resources :users, only: [:edit, :update, :show]

end
