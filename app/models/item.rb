class Item < ApplicationRecord
    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :picture,
      attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
      attachment_size: { less_than: 5.megabytes }
  
    has_attached_file :picture, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }
end
