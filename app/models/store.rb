class Store < ApplicationRecord
    has_many :items, :through => :product_stores
    has_many :product_stores, dependent: :destroy
    accepts_nested_attributes_for :product_stores, allow_destroy: true
end
