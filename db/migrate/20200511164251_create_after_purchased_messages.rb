class CreateAfterPurchasedMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :after_purchased_messages do |t|
      t.string :content
      
      t.timestamps
      
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.boolean :exhibitor, default: false
    end
  end
end
