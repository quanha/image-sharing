class ChangeName < ActiveRecord::Migration
  def up
    remove_column :orders, :name
  end
end
