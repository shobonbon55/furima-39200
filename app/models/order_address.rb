class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_num, :preference_id, :city, :house_num, :house_name, :phone_num, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_num, format: { with: /\A\d{3}[-]?\d{4}\z/, message: "is invalid" }
    validates :preference_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_num
    validates :phone_num, format: { with: /\A[0-9]{10,11}\z/, message: "is invalid" }
  end

  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :token, presence: true

  def save
    # 購入アイテムの情報を保存
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(post_num: post_num, preference_id: preference_id, city: city, house_num: house_num, house_name: house_name, phone_num: phone_num, order_id: order.id) 
  end


end

