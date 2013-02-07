AddressBook::Application.routes.draw do
  resources :entries do
    resources :addresses
  end
  root :to => 'entries#index'
end
