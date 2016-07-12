class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total
      t.string :phone
      t.string :email
      t.string :address
      t.string :note
      t.integer :status

      t.timestamps null: false
    end
  end
end
