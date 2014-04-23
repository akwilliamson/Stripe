NonProfit::Application.routes.draw do
  root to: 'nonprofits#index'
  resources :nonprofits
end
