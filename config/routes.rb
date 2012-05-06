T3::Application.routes.draw do
  resources :blueprints
  resources :items
  resources :relics

  match 'corp', to: 'blueprints#corp_index'

  root to: 'blueprints#index'
end
