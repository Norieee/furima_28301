require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_confirmation,name(first/last),name_kana(first/last),birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'nicknameが他ユーザーと重複している場合に登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.nickname = @user.nickname
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Nickname has already been taken')
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれていないと登録できないこと' do
      @user.email = 'abcgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'emailが他ユーザーと重複している場合に登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a12345'
      expect(@user).to be_valid
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字をそれぞれ含んでいなければ登録できないこと(1)' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password includes both half-width letters and half-width numbers')
    end

    it 'passwordが半角英数字をそれぞれ含んでいなければ登録できないこと(2)' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password includes both half-width letters and half-width numbers')
    end

    it 'passwordが半角英数字をそれぞれ含んでいなければ登録できないこと(3)' do
      @user.password = 'ＡＡＡ１１１'
      @user.password_confirmation = 'ＡＡＡ１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password includes both half-width letters and half-width numbers')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'passwordとpassword_confirmationが一致していないと登録できないこと' do
      @user.password = 'a11111'
      @user.password_confirmation = 'b22222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
      @user.first_name = 'tｵｶﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is not full-width characters')
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
      @user.last_name = 'tｵｶﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is not full-width characters')
    end

    it 'f_name_kanaが空では登録できないこと' do
      @user.f_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("F name kana can't be blank")
    end

    it 'f_name_kanaが全角（カタカナ）でないと登録できないこと' do
      @user.f_name_kana = 'tｵｶﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('F name kana is not full-width katakana characters')
    end

    it 'l_name_kanaが空では登録できないこと' do
      @user.l_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("L name kana can't be blank")
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
      @user.l_name_kana = 'tｵｶﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('L name kana is not full-width katakana characters')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
