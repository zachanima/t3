T3::Application.routes.draw do
  resources :blueprints
  resources :items
  resources :relics

  root to: 'blueprints#index'
end
