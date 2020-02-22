Rails.application.routes.draw do
  get 'grads/index'

  root 'grads#index'
end
