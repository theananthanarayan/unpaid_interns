Rails.application.routes.draw do
  get 'students/message'
  
  get 'students/profile'

  get 'students/index'

  get 'students/search'
  
  get 'students/login'
  
  get 'students/logout'
  
  resources :students

  root 'students#index'
  
  mount ActionCable.server => '/cable'
end
