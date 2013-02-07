AddressBook::Application.routes.draw do
  resources :addresses


  resources :entries
  root :to => 'entries#index'
end
