Rails.application.routes.draw do
 
 # resources :delivery_quests do
 #   collection { post :search, to: 'delivery_quests#index' }
 # end

  resources :delivery_quests
  
  resources :users
  
  resources :advanced_searches

  
  get 'new_search' => 'delivery_quests#new_search'
  post 'new_search' => 'delivery_quests#index'
  
  get 'sessions/new'

  root 'main_static_pages#home'
   
  # get 'help'    => 'main_static_pages#help'
  # get 'about'   => 'main_static_pages#about'
  # get 'contact' => 'main_static_pages#contact'
  get 'quests' => 'delivery_quests#index'
  
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'profile' => 'users#show'

end
