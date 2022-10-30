Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  get 'sign-up' => 'home#sign_up'
  post 'sign-up' => 'home#sign_up_new_user'
end
