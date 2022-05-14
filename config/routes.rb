Rails.application.routes.draw do
  get '/merchants/:id/inventory_items', to: 'inventory_items#index'
  get '/merchants/:id/inventory_items/new', to: 'inventory_items#new'
end
