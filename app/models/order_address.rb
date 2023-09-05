class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_num, :preference_id, :city, :house_num, :house_name, :phone_num

  with_options presence: true do
    validates :post_num,
    validates :preference_id
    validates :city
    validates :house_num
    validates :house_name
    validates :phone_num
  end

  def save
    order = Order.create

    Address.create
  end
  # ※にここに処理を書くよ



end

