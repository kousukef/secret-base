class ProductCategory < ApplicationRecord
   has_ancestry
   has_many :products, dependent: :destroy
   validates :name, presence: true
end
