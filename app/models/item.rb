class Item < ApplicationRecord
  belongs_to :user
  # has_one    :order
  has_one_attached :image

  validates :item_name,   presence:true
  validates :description, presence:true
  validates :price,       presence:true, numericality: { in: 300..99999 }

end
