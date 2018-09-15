Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :meals
  resources :recipes
  resources :ingredients, only: [ :create, :index, :edit ] do
    collection do
      get :search
      get :minerals
      get :vitamins
    end
    resources :size_conversions, only: [ :index ]
  end
end
