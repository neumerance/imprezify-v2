Rails.application.routes.draw do
  devise_for :users

  root to: 'landing_pages#home'

  resources :resume do
    resources :basic_info, only: :update
    member do
      get :preview
    end
  end
end
