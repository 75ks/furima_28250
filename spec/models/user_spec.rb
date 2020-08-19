require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nameとemailとpasswordとpassword_confirmationとfamily_nameとfirst_nameとfamily_name_kanaとfirst_name_kanaとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で半角英数字混合あれば登録できる' do
        @user.password = 'test12'
        @user.password_confirmation = 'test12'
        expect(@user).to be_valid
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.family_name = '田なカ'
        expect(@user).to be_valid
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '太ろウ'
        expect(@user).to be_valid
      end
      it 'family_name_kanaが全角（カタカナ）であれば登録できる' do
        @user.family_name_kana = 'タナカ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角（カタカナ）であれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが半角英数字混合でも5文字以下の場合登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが6文字以上でも半角英数字混合ではない場合登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードに半角英数字を使用してください")
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）でない場合登録できない' do
        @user.family_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字に全角文字を使用してください")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でない場合登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前に全角文字を使用してください")
      end
      it 'family_name_kanaが全角（カタカナ）でない場合登録できない' do
        @user.family_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)に全角カタカナを使用してください")
      end
      it 'first_name_kanaが全角（カタカナ）でない場合登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)に全角カタカナを使用してください")
      end
    end
  end
end
