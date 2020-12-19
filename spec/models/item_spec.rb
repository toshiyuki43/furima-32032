require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it 'title,text,price,category_id,item_condition_id,shipping_charge_id,prefecture_id,shipping_day_id,image,user_idが存在すれば商品出品することができる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'titleが空だと出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'titleが41文字以上だと出品できない' do
        @item.title = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Title is too long (maximum is 40 characters)')
      end

      it 'textが空だと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが1001文字以上だと出品できない' do
        @item.text = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end
      it 'priceが299以下だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceが10,000,000以上だと出品できない' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'item_condition_idが空だと出品できない' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition is not a number')
      end
      it 'item_condition_idが1だと出品できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition must be other than 1')
      end
      it 'shipping_charge_idが空だと出品できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge is not a number')
      end
      it 'shipping_charge_idが1だと出品できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'shipping_day_idが空だと出品できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day is not a number')
      end
      it 'shipping_day_idが1だと出品できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end