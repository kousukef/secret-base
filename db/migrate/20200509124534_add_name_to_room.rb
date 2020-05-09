class AddNameToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :name, :string
    change_column_null :rooms, :name, false
  end
end
