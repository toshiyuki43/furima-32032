require 'rails_helper'

RSpec.describe ItemOrder, type: :model do

  describe '購入者情報の保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    context '商品購入がうまくいく時' do
      it '全ての項目が入力されていれば購入ができる' do
        expect(@item_order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @item_order.building_name = ''
        expect(@item_order).to be_valid
      end
    end

    context '商品購入がうまくかない時' do
      it 'token(クレジットカード情報)が空だと購入ができない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入ができない' do
        @item_order.postal_code = ""
        @item_order.valid?
        expect(@item_order.errors.messages).to include({:postal_code => ["can't be blank", "is invalid. Include hyphen(-)"]})
      end
      it '郵便番号にハイフンがないと登録できない' do
        @item_order.postal_code = "12345678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が8桁でないと購入できない' do
        @item_order.postal_code = "123-458"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと購入できない' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'city_nameが空だと購入できない' do
        @item_order.city_name = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City name can't be blank")
      end
      it 'block_nameが空だと購入できない' do
        @item_order.block_name = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Block name can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと購入できない' do
        @item_order.phone_number = '０９０３３３３５５５５'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberにハイフンが入ると購入できない' do
        @item_order.phone_number = '090-2222'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが11桁を超えると購入できない' do
        @item_order.phone_number = '090444455555'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'tokenが空だと購入できない' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end