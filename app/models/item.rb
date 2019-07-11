class Item < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100 }
    validates :price, presence: true
    validates :description, presence: true, length: { maximum: 500 }
    validates :picture,
      attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
      attachment_size: { less_than: 5.megabytes }
  
    has_attached_file :picture, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }
    has_many :stores, :through => :product_stores
    has_many :product_stores, dependent: :destroy
end
