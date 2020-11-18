require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する商品の保存' do
    context "出品する商品が保存できる場合" do
      it "全項目が存在すれば保存できる" do
        expect(@item).to be_valid
      end
    end

    context "出品する商品が保存できない場合" do
      it "商品画像がないと出品する商品は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品する商品は保存できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと出品する商品は保存できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーの情報がないと出品する商品は保存できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーの情報で1番目を選ぶと商品は保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end    
      it "商品の状態についての情報がないと出品する商品は保存できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "商品状態についての情報で1番目を選ぶと商品は保存できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end    
      it "配送料の負担についての情報がないと出品する商品は保存できない" do
        @item.fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it "配送料の負担についての情報で1番目を選ぶと商品は保存できない" do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end    
      it "発送元の地域についての情報がないと出品する商品は保存できない" do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "発送元の地域について情報で1番目を選ぶと商品は保存できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end    
      it "発送までの日数についての情報がないと出品する商品は保存できない" do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
      end
      it "発送までの日数についての情報で1番目を選ぶと商品は保存できない" do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end    
      it "販売価格についての情報がないと出品する商品は保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が300円以下だと商品は保存できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "販売価格が9,999,999円以上だと商品は保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it "販売価格が半角数字でないと商品は保存できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end   
  end
end