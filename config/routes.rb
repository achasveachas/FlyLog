Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  #Omniauth routes
  get '/auth/github/callback' => 'sessions#create_oauth'
  get '/auth/failure' => 'index#home'

  resources :pilots do
    resources :flights
  end

  get '/pilots/:id/admin' => 'pilots#admin', as: 'admin'

end
