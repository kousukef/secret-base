class RenameUserImage < ActiveRecord::Migration[6.0]
  def change
     rename_column :users, :user_image, :avatar
  end
end
