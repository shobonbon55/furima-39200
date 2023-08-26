require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end
 # bundle exec rspec spec/models/item_spec.rb


 
  describe '商品出品' do
    context '商品出品できる時' do
      it '画像、含めて全て必要な情報がセットされた時' do
        @item = FactoryBot.build(:item)
        expect(@item).to be_valid
      end
    end

  context '新規登録できないとき' do
    it "item nameが空だと登録できない" do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item name can't be blank")  
    end
    it "description が空だと登録できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Description can't be blank")  
    end
     it "category_id が1だと登録できない" do
      @item.category_id = 1
      @item.valid?
          expect(@item.errors.full_messages).to include ("Category can't be blank")  
    end
    it "condition_id が1だと登録できない" do
      @item.condition_id = 1
      @item.valid?
          expect(@item.errors.full_messages).to include ("Condition can't be blank")  
    end
    it "courier_fare_id が1だと登録できない" do
      @item.courier_fare_id = 1
      @item.valid?
          expect(@item.errors.full_messages).to include ("Courier fare can't be blank")  
    end
    it "send_area_id, が1だと登録できない" do
      @item.send_area_id = 1
      @item.valid?
          expect(@item.errors.full_messages).to include ("Send area can't be blank")  
    end
    it "send_period_id, が1だと登録できない" do
      @item.send_period_id = 1
      @item.valid?
          expect(@item.errors.full_messages).to include ("Send period can't be blank")  
    end
    it "send_period_id, が1だと登録できない" do
      @item.send_period_id = 1
      @item.valid?
          expect(@item.errors.full_messages).to include ("Send period can't be blank")  
    end

    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price can't be blank")
    end

    it "priceが300未満できない" do
      @item.price = "299"
      @item.valid?
       expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
    end

    it "priceが100000以上では登録できない" do
    @item.price = "100000"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 99999")
    end


    it "画像がないと登録できない" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include ("Image can't be blank")
  end
  end
end
end