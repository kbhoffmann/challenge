Rails.application.routes.draw do
  resources :merchants, only: [:show] do
    resources :inventory_items, except: [:delete]
    get '/inventory_items/:id/delete_item', to: 'inventory_items#delete_item_form'
    patch '/inventory_items/:id/delete', to: 'inventory_items#delete_item'
  end
end
