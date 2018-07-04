class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :description
      t.date :due_date
      t.integer :status,default: 1

      t.timestamps
    end
  end
end
