Rails.application.routes.draw do
  devise_for :users
  resources :students

   root 'welcome#index'
   get '/pricing', to: 'welcome#pricing'
end
