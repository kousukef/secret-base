class AddNullFalseToMessage < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :products_id, :product_id
    change_column_null :messages, :product_id, false
  end
end
