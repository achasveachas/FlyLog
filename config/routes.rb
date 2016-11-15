Rails.application.routes.draw do
  get 'index/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
