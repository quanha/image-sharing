class AddHomepageCategories < ActiveRecord::Migration
  def change
    add_column :categories, :at_homepage, :integer
  end
end
