class AddForSaleToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :for_sale, :boolean, defalut: true
    change_column_null :products, :for_sale, false, true
  end
end
