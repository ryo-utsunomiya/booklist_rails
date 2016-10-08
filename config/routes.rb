Rails.application.routes.draw do
  post 'books/:id/plus_rate', to: 'books#plus_rate'
  resources :books
  root 'books#index'
end
