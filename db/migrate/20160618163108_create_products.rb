class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :detail
      t.string :code
      t.string :image
      t.integer :category_id
      t.integer :suppler_id
      t.integer :price
      t.integer :sale_price

      t.timestamps null: false
    end
  end
end
