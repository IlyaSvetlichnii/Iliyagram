Rails.application.routes.draw do

  get ':name', to: 'profiles#show', as: :profile 
  
  post ':name/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  root 'posts#index'  

  devise_for :users
  
  resources :comments
  
  resources :posts do  
    resources :comments
    member do
      get 'like'
    end
  end  

end
