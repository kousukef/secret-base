class AddDefaultToProduct < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :for_sale, :boolean, default: true
  end
end
