Rails.application.routes.draw do
  resources :tasks, param: :slug, except: [:new, :edit]
  resources :users, param: :id



  root "home#index"
  get '*path', to: 'home#index', via: :all
end