require 'rails_helper'

RSpec.describe Detail, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      @detail = FactoryBot.build(:detail, item_id: item.id, user_id: item.user_id)
      sleep 0.1
    end

    context '購入情報を保存できる' do
      it '全ての値が正しく入力されている' do
        expect(@detail).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @detail.building = ''
        expect(@detail).to be_valid
      end
    end

    context '購入情報を保存できない' do
      it 'item_idが取得できていない' do
        @detail.item_id = ''
        @detail.valid?
        expect(@detail.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが取得できていない' do
        @detail.user_id = ''
        @detail.valid?
        expect(@detail.errors.full_messages).to include("User can't be blank")
      end
      it 'postal_codeが未入力' do
        @detail.postal_code = ''
        @detail.valid?
        expect(@detail.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがない場合、保存できない' do
        @detail.postal_code = 7_778_888
        @detail.valid?
        expect(@detail.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが未入力' do
        @detail.prefecture_id = '1'
        @detail.valid?
        expect(@detail.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが未入力' do
        @detail.city = ''
        @detail.valid?
        expect(@detail.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが未入力' do
        @detail.addresses = ''
        @detail.valid?
        expect(@detail.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが未入力' do
        @detail.phone_number = ''
        @detail.valid?
        expect(@detail.errors.full_messages).to include('Phone number (-)を入れず10桁もしくは11桁で入力してください')
      end
      it 'phone_numberが9桁以下である' do
        @detail.phone_number = 0o00
        @detail.valid?
        expect(@detail.errors.full_messages).to include('Phone number (-)を入れず10桁もしくは11桁で入力してください')
      end
      it 'phone_numberが12桁以上である' do
        @detail.phone_number = 111_222_333_444
        @detail.valid?
        expect(@detail.errors.full_messages).to include('Phone number (-)を入れず10桁もしくは11桁で入力してください')
      end
      it 'phone_numberに数字以外が含まれている' do
        @detail.phone_number = '090-0000-22'
        @detail.valid?
        expect(@detail.errors.full_messages).to include('Phone number (-)を入れず10桁もしくは11桁で入力してください')
      end
      it 'token情報がない' do
        @detail.token = ''
        @detail.valid?
        expect(@detail.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
