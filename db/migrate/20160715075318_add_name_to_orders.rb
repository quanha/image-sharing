class AddNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :name, :integer
  end
end
