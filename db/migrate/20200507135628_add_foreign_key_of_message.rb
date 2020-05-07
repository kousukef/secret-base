class AddForeignKeyOfMessage < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :products, foreign_key: true
  end
end