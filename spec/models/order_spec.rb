require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    context '商品購入がうまくいく時' do
      it '全ての情報が正しく入力された時に購入できる' do
        expect(@item_order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @item_order.building_name = ''
        expect(@item_order).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'postal_codeが空だと購入できない' do
        @item_order.postal_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeにハイフンが入っていないと購入できない' do
        @item_order.postal_code = '0009999'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが全角数字だと購入できない' do
        @item_order.postal_code = '０００-００００'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが1だと購入できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'block_nameが空だと購入できない' do
        @item_order.block_name = ''
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