Rails.application.routes.draw do
  root to: "agents#random_agent"

  resources :agents do
    resources :uploaded_transactions
    post '/import_from_csv', to: 'uploaded_transactions#import_from_csv'
  end
end
