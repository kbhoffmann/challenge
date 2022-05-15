Rails.application.routes.draw do
  resources :merchants, only: [:show] do
    resources :inventory_items
  end
end
