Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/count' => 'requests#count'
  resources :users
  resources :requests
  get '/profile' => 'users#profile'
  get '/owner' => 'requests#owner'
  get '/conversation' => 'conversations#getconversation'
  resources :messages, only: [:create]
  resources :volunteers, only: [ :create, :destroy ]
  mount ActionCable.server => '/cable'

end
