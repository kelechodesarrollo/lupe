Rails.application.routes.draw do

  devise_for :users
  resources :listings do
  	resources :orders
  end


  get 'seller' => 'listings#seller'
  root :to => "listings#index"

end
