class Product < ApplicationRecord
  mount_uploaders :images, ImagesUploader
  serialize :images, JSON
  belongs_to :seller, class_name: 'User'
  belongs_to :purchaser, class_name: 'User', optional: true
  belongs_to :category
  has_many :q_and_a_messages, dependent: :destroy
  has_many :after_purchased_messages, dependent: :destroy
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 2000}
  validates :price, presence: true
  validates :images, presence: true
  validates :seller_id, presence: true
end
