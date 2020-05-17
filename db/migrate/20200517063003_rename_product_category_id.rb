class RenameProductCategoryId < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :product_category_id, :category_id
  end
end
