AddressBook::Application.routes.draw do
  resources :entries do
  root :to => 'entries#index'
end
