class CreatePurchasedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :purchased_products do |t|

      t.timestamps
    end
  end
end
