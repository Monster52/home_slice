Rails.application.routes.draw do

  devise_for :users

  resources :students do
    resources :curriculums
  end

   root 'welcome#index'
   get '/pricing', to: 'welcome#pricing'
end
