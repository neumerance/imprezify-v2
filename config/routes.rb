Rails.application.routes.draw do
  devise_for :users

  root to: 'landing_pages#home'

  resources :resume do
    resources :basic_info, only: :update
    resources :work_experiences, only: [:new, :create, :destroy]
    resources :educations, only: [:new, :create, :destroy]
    member do
      get :preview
    end
  end
end
