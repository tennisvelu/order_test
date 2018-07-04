class AddFieldMoney < ActiveRecord::Migration[5.2]
  def change
    add_monetize :orders, :amount, currency: { present: true }
  end
end
