class AddNullFalseToProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :product_category_id, :integer, null: false
  end
end
