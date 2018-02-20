Rails.application.routes.draw do
  resources :api_interfaces

  root 'api_interfaces#location'

  post 'display' => 'api_interfaces#display'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
