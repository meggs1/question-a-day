Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :questions
  resources :answers
  resources :tags
  resources :sessions

  root 'welcome#index'
end
