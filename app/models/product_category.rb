class ProductCategory < ApplicationRecord
   has_ancestry
   has_many :products
   validates :name, presence: true
end
