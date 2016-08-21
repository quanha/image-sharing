class AddHomepageToProductTypes < ActiveRecord::Migration
  def change
    add_column :product_types, :homepage, :integer
    add_column :product_types, :collection_homepage, :integer
  end
end
