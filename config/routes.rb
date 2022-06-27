Rails.application.routes.draw do
  # root :to => 'home#index'
  root :to => 'products#index'
  resources :products
  get '/products', :to => 'products#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
