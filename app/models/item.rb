class Item < ApplicationRecord
  belongs_to :user
  # has_one    :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :courier_fare
  belongs_to :send_area
  belongs_to :send_period

   validates :item_name,   presence:true, length: {maximum: 40 }
   validates :description, presence:true, length: {maximum: 1000 }
   validates :price, presence: true, numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
   validates :image,       presence: true, unless: :was_attached?
   validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :courier_fare_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :send_area_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :send_period_id, numericality: { other_than: 1 , message: "can't be blank"}

  def was_attached?
    self.image.attached?
  end

end
