Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]
  resources :questions, only: [:show, :index, :edit, :update] do 
    resources :answers, only: [:new, :edit, :index, :show]
  end
  resources :answers
  resources :tags
  
  root 'welcome#index'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/popular-questions' => 'questions#popular_questions'
  get '/todays-question' => 'questions#todays_question'
  
  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/logout' => 'sessions#destroy'
  
  match '*path', to: redirect('/'), via: :all
end
