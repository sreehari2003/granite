Rails.application.routes.draw do
  defaults format: :json do
    resources :tasks, param: :slug, except: [:new, :edit]
    resources :users, param: :id
  end



  root "home#index"
  get '*path', to: 'home#index', via: :all
end