Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :questions do 
    resources :answers
  end
  resources :answers
  resources :tags
  
  root 'welcome#index'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/popular_questions' => 'questions#top_questions'
  
  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/logout' => 'sessions#destroy'
end
