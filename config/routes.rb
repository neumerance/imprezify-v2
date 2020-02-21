Rails.application.routes.draw do
  default_url_options host: ENV['DOMAIN'], protocol: :https
  require 'sidekiq/web'

  devise_for :users, controllers: { registrations: 'registrations' }
  authenticate :user, lambda { |u| u.email == ENV['WEBMASTER'] } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'landing_pages#home'
  get '/contacts', to: 'landing_pages#contacts'
  get '/contribute', to: 'landing_pages#contribute'
  get '/write', to: 'landing_pages#write'
  get '/privacy', to: 'landing_pages#privacy'

  resources :resume do
    resources :basic_info, only: :update
    resources :work_experiences, only: [:new, :create, :destroy]
    resources :educations, only: [:new, :create, :destroy]
    resources :certification_and_achievements, only: [:new, :create, :destroy]
    resources :character_references, only: [:new, :create, :destroy]
    resources :contacts, only: [:new, :create, :destroy]
    resources :skills, only: [:new, :create, :destroy]
    member do
      get :export_as_pdf
      get :generate_share_link
    end
  end

  get 'resume/share/:share_code', to: 'resume#share', as: 'resume_share'
end
