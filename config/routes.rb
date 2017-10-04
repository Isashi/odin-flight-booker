Rails.application.routes.draw do
  resources :flights
  resources :bookings
  
  root "flights#home"
end
