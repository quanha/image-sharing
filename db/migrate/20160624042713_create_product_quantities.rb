class CreateProductQuantities < ActiveRecord::Migration
  def change
    create_table :product_quantities do |t|
      t.integer :product_id
      t.integer :size
      t.integer :quantity
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
