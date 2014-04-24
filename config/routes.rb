NonProfit::Application.routes.draw do
  root to: 'nonprofits#index'
  resources :nonprofits do
    resources :charges
  end
end
