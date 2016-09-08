Rails.application.routes.draw do

  post ':user_name/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

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
