Rails.application.routes.draw do
  root to: 'pages#home'

  resources :orders, only: %i[new create destroy]

  resources :orders, only: %i[index show] do
    resources :meals, only: %i[index new show create destroy], as: 'with_meals'
  end

  resources :meals, only: %i[index show destroy], as: 'standalone_meals'
end
