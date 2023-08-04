Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  resources :restaurants do
    resources :meals
  end
end
