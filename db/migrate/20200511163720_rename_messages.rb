class RenameMessages < ActiveRecord::Migration[6.0]
  def change
     rename_table :messages, :q_and_a_messages
  end
end
