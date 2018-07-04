class OrderSerializer < ActiveModel::Serializer
  attributes :id, :amount_cents, :amount_currency, :description, :due_date, :status  
end
