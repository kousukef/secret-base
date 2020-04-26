class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable,
         :validatable,:confirmable, :lockable, :timeoutable, :trackable
   mount_uploader :user_iamge, UserImageUploader
   validates :name, presence: true, length: {maximum: 30}
end
