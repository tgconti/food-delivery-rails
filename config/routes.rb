Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  resources :restaurants do
    resources :meals
    resources :orders, only: %i[index new create]
  end
  resources :orders, only: [:show]
  resources :profiles, only: %i[show edit]
end
