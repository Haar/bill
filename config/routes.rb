Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'bill#show'

  get '/pdf', to: 'bill#pdf', as: 'bill_pdf'
end
