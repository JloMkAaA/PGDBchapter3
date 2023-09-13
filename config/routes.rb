Rails.application.routes.draw do
  get 'users/new'
  root 'static_page#home'
  get 'help' => 'static_page#help'
  get 'about' => 'static_page#about'
  get 'signup' => 'users#new'
end
