Rails.application.routes.draw do
  devise_for :users

  root to: 'landing_pages#home'

  resources :resume do
    member do
      get :add_more_entity
    end
  end
end
