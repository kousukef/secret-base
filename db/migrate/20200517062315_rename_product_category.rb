class RenameProductCategory < ActiveRecord::Migration[6.0]
  def change
    rename_table :product_categories, :categories
  end
end
