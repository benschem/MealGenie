Rails.application.routes.draw do
  root to: 'pages#home'

  GET    /orders/:order_id/meals(.:format)    meals#index
  POST   /orders/:order_id/meals(.:format)        meals#create

  # resources :orders, only %i[index]

  resources :orders do
    resources :meals, only: %i[index new show create destroy]
  end

  resources :meals
end
