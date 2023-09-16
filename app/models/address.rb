class Address < ApplicationRecord
  belongs_to :order

  # validates :post_num,        presence:true, format:{ with: /\A[0-9]{7}\z/, message: "is invalid" }
  # validates :preference_id,   presence:true, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :city,            presence:true,
  # validates :house_num,       presence:true,
  # validates :phone_num,       presence:true, format:{ with: /\A[0-9]{9}\z/, message: "is invalid" }
  
end


