Wikifool::Application.routes.draw do
  
  get "welcome/about"
  devise_for :users
  resources :wikis


  root to: 'welcome#about'


end




