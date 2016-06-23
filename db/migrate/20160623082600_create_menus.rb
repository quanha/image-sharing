class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :url_code
      t.integer :display_order

      t.timestamps null: false
    end
  end
end
