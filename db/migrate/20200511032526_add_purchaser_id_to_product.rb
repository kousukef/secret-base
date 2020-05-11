class AddPurchaserIdToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :purchaser_id, :integer
    
    remove_column :products, :for_sale, :boolean
  end
end
