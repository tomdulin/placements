Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :invoices, only: %i[ index show new ] do
    resources :versions, only: :index
    resources :line_items, only: %i[ update index ]
  end

  resources :campaigns, only: %i[ index show ] 
  
  root "invoices#index"
end
