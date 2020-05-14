class Product < ApplicationRecord
  mount_uploaders :images, ImagesUploader
  serialize :images, JSON
  belongs_to :seller, class_name: 'User'
  belongs_to :purchaser, class_name: 'User', optional: true
  belongs_to :product_category
  has_many :q_and_a_messages, dependent: :destroy
  has_many :after_purchased_messages, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  
  
end
