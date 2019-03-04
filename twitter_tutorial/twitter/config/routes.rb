Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show]
  resources :tweets, only: [:new, :create]

  #forma alternativa
  #get'/users', to 'users#index'
end
