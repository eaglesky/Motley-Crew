Rails.application.routes.draw do
 
  resources :delivery_quests
  resources :users
  


  

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
