require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmatio,family,fristnameが存在すれば登録できる' do
        @user = FactoryBot.build(:user)
        expect(@user).to be_valid
      end
    end
  context '新規登録できないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it "email空だと登録できない" do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it "既に登録のemailでは登録ができない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "emailに@を含まないと登録できない" do
      @user.email ='tarogmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include ('Email is invalid')
    end
    it "パスワードが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが5文字以下は登録できない" do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが129文字以上は登録できない" do
      @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it "パスワードは半角英字のみの場合登録できない" do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードは半角数字のみの場合登録できない" do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードは半角英数字以外が含まれている場合登録できない" do
      @user.password = '123d5;'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードと確認パスワードが一致しないと登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "名前の全角名字が空と登録できない" do
      @user.first_name_zen = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name zen can't be blank")
    end
    it "名前は全角名前が空だと登録できない" do
      @user.family_name_zen = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name zen can't be blank")
    end
    it "名前カナは名字がないと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank") 
    end
    it "名前カナは名字がないと登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank") 
    end
    it "姓（全角）に半角文字が含まれていると登録できない" do
      @user.first_name_zen = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name zen is invalid")
    end
    it "名（全角）に半角文字が含まれていると登録できない" do
      @user.family_name_zen = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name zen is invalid")
    end
    it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = 'yamada山田1;'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid") 
    end
    it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.family_name_kana = '太郎taro1;'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid") 
    end
    it "生年月日がないと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank") 
    end
  end
end
end

