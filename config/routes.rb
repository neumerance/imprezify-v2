Rails.application.routes.draw do
  devise_for :users

  root to: 'landing_pages#home'

  resources :resume do
    resources :basic_info, only: :update
    resources :work_experiences, only: [:new, :create, :destroy]
    resources :educations, only: [:new, :create, :destroy]
    resources :certification_and_achievements, only: [:new, :create, :destroy]
    resources :character_references, only: [:new, :create, :destroy]
    resources :contacts, only: [:new, :create, :destroy]
    resources :skills, only: [:new, :create, :destroy]
    member do
      get :preview
      get :export_as_pdf
      get :generate_share_link
    end
  end

  get 'resume/share/:share_code', to: 'resume#share', as: 'resume_share'
end
