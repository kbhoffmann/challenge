Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  resources :merchants, only: [:show] do
    resources :inventory_items, except: [:show, :delete]
    get '/inventory_items/:id/delete_item', to: 'inventory_items#delete_item_form'
    patch '/inventory_items/:id/delete', to: 'inventory_items#delete_item'
    patch '/inventory_items/:id/un_delete', to: 'inventory_items#un_delete_item'
  end
end
