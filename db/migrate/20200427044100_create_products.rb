class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :product_image, null: false

      t.timestamps
      
      t.references :user, null: false, foreign_key: true
    end
  end
end
