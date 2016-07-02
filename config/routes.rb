Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#bill'

  get '/bill_pdf', to: 'pages#bill_pdf', as: 'bill_pdf'
end
