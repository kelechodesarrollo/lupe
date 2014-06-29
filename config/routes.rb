Rails.application.routes.draw do

  root :to => "listings#index"

  devise_for :users
  resources :listings do
  	resources :orders, only: [:new, :create]
  end


  get 'seller' => 'listings#seller'
  get 'sales' => 'orders#sales'
  get 'purchases' => 'orders#purchases'
  

end
