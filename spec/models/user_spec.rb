require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーの新規登録ができる' do
      it 'ユーザーの新規登録ができる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザーの新規登録ができない' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複するemailが存在する場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'メールアドレスに@が入っていないと登録できない' do
        @user.email = 'asdf'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード半角のアルファベット、数字の両方を使用してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード半角のアルファベット、数字の両方を使用してください')
      end
      it 'passwordが全角文字を使用しては登録できない' do
        @user.password = 'ａｂｃｄｅｆ'
        @user.password_confirmation = 'ａｂｃｄｅｆ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード半角のアルファベット、数字の両方を使用してください')
      end
      it 'last_nameが未入力では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(姓）を入力してください", "お名前(姓）全角で入力してください")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'ﾃﾗﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(姓）全角で入力してください')
      end
      it 'first_nameが未入力では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名)を入力してください")
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'ﾋﾛﾕｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(名)全角で入力してください')
      end
      it 'last_name_kanaが未入力では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（姓）を入力してください")
      end
      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'ﾃﾗﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（姓）全角カタカナで入力してください')
      end
      it 'first_name_kanaが未入力では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名)を入力してください")
      end
      it 'first_name_kanaが全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'ﾋﾛﾕｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ(名)全角カタカナで入力してください')
      end
      it '生年月日が未入力では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
