Rails.application.routes.draw do
  

  root 'static_pages#home'
  get '/about' => 'static_pages#about'
  delete '/logout' => 'sessions#destroy'

  delete "posts/destroy" => "posts#destroy";
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions,only:[:new,:create]
  resources :posts,only:[:create,:destroy]
  resources :relationships,only:[:create,:destroy]
end
