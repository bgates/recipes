Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :meals
  resources :recipes
  resources :ingredients, only: [ :create, :index ] do
    collection do
      get :search
    end
    resources :size_conversions, only: [ :index ]
  end
end
