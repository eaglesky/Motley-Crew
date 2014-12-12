Rails.application.routes.draw do
 

  resources :quests
  
  resources :users
  
  resources :advanced_searches

  
  get 'new_search' => 'quests#new_search'
  post 'new_search' => 'quests#index'
  
  get 'sessions/new'

  root 'main_static_pages#home'
   
  
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
 # delete 'logout'  => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'
  
  get 'profile' => 'users#show'

end
