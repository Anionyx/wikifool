Wikifool::Application.routes.draw do
  get "wiki/new"
  get "welcome/about"
  devise_for :users

  root to: 'welcome#about'
end
