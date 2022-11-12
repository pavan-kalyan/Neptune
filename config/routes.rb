Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  get 'sign-up' => 'home#sign_up'
  post 'sign-up' => 'home#sign_up_new_user'
  get 'sign-in' => 'home#sign_in'
  post 'sign-in' => 'home#sign_in_user'
  get 'employee' => 'stakes#show'
  get 'logout' => 'home#logout'
end
