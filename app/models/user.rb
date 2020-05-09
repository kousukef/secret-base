class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable,
         :validatable,:confirmable, :lockable, :timeoutable, :trackable
   mount_uploader :user_image, UserImageUploader
   validates :name, presence: true, length: {maximum: 30}
   has_many :products, dependent: :destroy
   has_many :messages, dependent: :destroy
   has_many :chat_messages, dependent: :destroy
end
