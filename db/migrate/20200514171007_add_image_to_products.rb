class AddImageToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :images, :string
    change_column_null :products, :images, false
  end
end
