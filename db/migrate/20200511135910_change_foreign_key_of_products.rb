class ChangeForeignKeyOfProducts < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :products, :users
    
    rename_column :products, :user_id, :seller_id
  end
end
