class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,:recoverable, :rememberable,
        :validatable, :lockable, :timeoutable, :trackable, :confirmable
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: {maximum: 30}
  has_many :q_and_a_messages, dependent: :destroy
  has_many :after_purchased_messages, dependent: :destroy
  has_many :purchased_products, class_name: 'Product', foreign_key: 'purchaser_id', dependent: :destroy
  has_many :sales_products, class_name: 'Product', foreign_key: 'seller_id', dependent: :destroy
end
