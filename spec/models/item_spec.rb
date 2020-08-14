require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
    end

    it "image,name,explanation,category,status,shipping_charges,prefecture,day_until_shipping,priceが存在すれば出品できること" do
      expect(@item).to be_valid
    end

    it "imageが空では出品できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では出品できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "explanationが空では出品できないこと" do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "categoryが未選択では出品できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must select")
    end

    it "satusが未選択では出品できないこと" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must select")
    end

    it "shipping_chargesが未選択では出品できないこと" do
      @item.shipping_charges_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges must select")
    end

    it "prefectureが未選択では出品できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must select")
    end

    it "days_until_shippingが未選択では出品できないこと" do
      @item.days_until_shipping_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days until shipping must select")
    end

    it "priceが空では出品できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが設定範囲外（¥300未満、¥9,999,999超）では出品できないこと(1)" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of the setting range")
    end

    it "priceが設定範囲外（¥300未満、¥9,999,999超）では出品できないこと(2)" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of the setting range")
    end

    it "priceが半角数字でないと出品できないこと" do
      @item.price = "９００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of the setting range")
    end
  end
end
