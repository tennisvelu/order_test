Rails.application.routes.draw do
  
  put "order_to_next_state" => "orders#order_to_next_state"
  get "overdue_orders" => "orders#overdue_orders"
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
