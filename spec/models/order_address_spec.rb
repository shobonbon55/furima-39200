require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
 
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)  # user を item に関連付ける
      # order = FactoryBot.create(:order)
        @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
    end


    context '内容に問題がある場合' do
      it 'post_num' do
        @order_address.post_num,= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post num can't be blank")
      end
      it 'post_num' do
        @order_address.post_num,= '12308212'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post num is invalid")
      end
      it 'preference_id ' do
        @order_address.preference_id,= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Preference can't be blank")
      end
      it 'city ' do
        @order_address.city,= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_num ' do
        @order_address.house_num,= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House num can't be blank")
      end
      it 'phone_num' do
        @order_address.phone_num,= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_num' do
        @order_address.phone_num,= '090-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end


    end
  end
end
# bundle exec rspec spec/models/order_address_spec.rb