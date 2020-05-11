class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable,
         :validatable,:confirmable, :lockable, :timeoutable, :trackable
   mount_uploader :user_image, UserImageUploader
   validates :name, presence: true, length: {maximum: 30}
   has_many :messages, dependent: :destroy
   has_many :chat_messages, dependent: :destroy
   has_many :purchased_products, class_name: 'Product', foreign_key: 'purchaser_id', dependent: :destroy
   has_many :sales_products, class_name: 'Product', foreign_key: 'seller_id', dependent: :destroy
end
