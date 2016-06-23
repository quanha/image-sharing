class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.text :address
      t.text :working_time

      t.timestamps null: false
    end
  end
end
