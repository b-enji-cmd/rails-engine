Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
	  namespace :v1 do
	  	get 'merchants', to: 'merchants#index'
	  	get 'merchants/:id', to: 'merchants/search#show', as: :merchant
	  	get 'merchants/:id/items', to: 'merchants/merchant_items#index', as: :merchant_items

	  	get 'items', to: 'items#index'
	  	post 'items', to: 'items#create'
	  	get 'items/:id', to: 'items/search#show', as: :item
	  	put 'items/:id', to: 'items#update', as: :item_update
	  	get 'items/:id/merchant', to: 'items/items_merchant#show', as: :item_merchant
	  	delete 'items/:id', to: 'items#destroy', as: :item_destroy
  	end
  end
end
