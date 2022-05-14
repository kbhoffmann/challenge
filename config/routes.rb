Rails.application.routes.draw do
  get '/merchants/:id/inventory_items', to: 'inventory_items#index'
  get '/merchants/:id/inventory_items/new', to: 'inventory_items#new'
  get '/merchants/:id/inventory_items/:item_id/edit', to: 'inventory_items#edit'
  post '/merchants/:id/inventory_items', to: 'inventory_items#create'
  patch '/merchants/:id/inventory_items/:item_id', to: 'inventory_items#update'
end
