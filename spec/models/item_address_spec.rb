require 'rails_helper'

RSpec.describe ItemAddress, type: :model do
  describe '商品購入機能' do
    before do
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('app/assets/images/item-sample.png')
      item.save
      user = FactoryBot.create(:user)
      @itemAddress = FactoryBot.build(:itemAddress, item_id: item.id, user_id: user.id)
    end

    # 正確なカード情報(number,exp_month,exp_year,cvc)が入力されていることを前提とする(tokenをPAY.JPから取得できている)
    it 'postal_code,prefecture_id,city,address,building,phone_numberが入力されていれば購入できること' do
      expect(@itemAddress).to be_valid
    end

    it 'postal_codeが空では購入できないこと' do
      @itemAddress.postal_code = nil
      @itemAddress.valid?
      expect(@itemAddress.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンが含まれていないと購入できないこと' do
      @itemAddress.postal_code = "1234567"
      @itemAddress.valid?
      expect(@itemAddress.errors.full_messages).to include("Postal code input correctly")
    end

    it 'prefecture_idが空では購入できないこと' do
      @itemAddress.prefecture_id = nil
      @itemAddress.valid?
      expect(@itemAddress.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では購入できないこと' do
      @itemAddress.city = nil
      @itemAddress.valid?
      expect(@itemAddress.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では購入できないこと' do
      @itemAddress.address = nil
      @itemAddress.valid?
      expect(@itemAddress.errors.full_messages).to include("Address can't be blank")
    end

    it 'buildingが入力されていなくても購入できること' do
      @itemAddress.building = nil
      expect(@itemAddress).to be_valid
    end

    it 'phone_numberが空では購入できないこと' do
      @itemAddress.phone_number = nil
      @itemAddress.valid?
      expect(@itemAddress.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberにハイフンが含まれていると購入できないこと' do
      @itemAddress.phone_number = "090-1234-5678"
      @itemAddress.valid?
      expect(@itemAddress.errors.full_messages).to include("Phone number is invalid. If it includes -, remove it")
    end

    it 'phone_numbeが12文字以上だと購入できないこと' do
      @itemAddress.phone_number = "0901234567890"
      @itemAddress.valid?
      expect(@itemAddress.errors.full_messages).to include("Phone number is invalid. If it includes -, remove it")
    end
  end
end