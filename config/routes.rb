Rails.application.routes.draw do
  
  root 'posts#index'  

  devise_for :users
  
  resources :comments
  
  resources :posts do  
    resources :comments
  end  

end
