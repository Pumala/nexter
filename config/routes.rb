Rails.application.routes.draw do

  devise_for :users

  resources :tasks

  # controller name then # before action name
  root 'pages#home'

# when you go to the '/about' you go to the pages controller in the about action
  get 'about' => 'pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
