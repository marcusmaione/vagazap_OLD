Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'profile', to: 'pages#profile'
  # Generic syntax:
  # verb 'path', to: 'controller#action', as: :route_name
  resources :degrees
  resources :experiences
  resources :courses
  resources :companies do
    resources :jobs
  end
end
