Rails.application.routes.draw do
  constraints(lambda { |req| req.format == :json }) do
    resources :tasks, param: :slug, except: [:new, :edit]
    resources :users, only: %i[index create]
    resource  :session, only: :create
  end



  root "home#index"
  get '*path', to: 'home#index', via: :all
end