class AddExhibitorToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :exhibitor, :boolean, default: false, unll: false
  end
end
