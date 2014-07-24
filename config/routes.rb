Wikifool::Application.routes.draw do
  get "welcome/about"
  devise_for :users

  root to: 'welcome#about'
end
