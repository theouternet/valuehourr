Rails.application.routes.draw do
 resources :locations do
      # nested resource for shares
    resources :shares
  end
  
  resources :shares

  resources :drinks

  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#EVERYTHING ABOVE THIS LINE NEEDS EDIT, NESTING

root 'welcome#home'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#create'

end
