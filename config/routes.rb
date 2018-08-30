Rails.application.routes.draw do

  resources :meals
  resources :recipes
  resources :ingredients, only: [ :create ] do
    collection do
      get :search
    end
    resources :size_conversions, only: [ :index ]
  end
end
