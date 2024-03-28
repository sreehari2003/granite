Rails.application.routes.draw do
  defaults format: :json do
    resources :tasks, param: :slug, except: [:new, :edit]
    resources :users, only: %i[index create]
  end



  root "home#index"
  get '*path', to: 'home#index', via: :all
end