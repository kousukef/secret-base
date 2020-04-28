class AddProductCategoryIdToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_category_id, :integer
  end
end
