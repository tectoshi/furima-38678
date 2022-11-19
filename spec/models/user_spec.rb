  require 'rails_helper'

  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録' do
      context 'ユーザー登録できる場合' do
        it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,date_of_birthが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
      context 'ユーザー登録できない場合' do
        # 空のテスト
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'date_of_birthが空では登録できない' do
          @user.date_of_birth = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Date of birth can't be blank")
        end
        #// 空のテスト

        # emailのテスト
        it '重複したemailが存在すると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        #// emailのテスト

        # passwordのテスト
        it 'passwordが5文字以下では登録できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'passwordが129文字以上では登録できない' do
          @user.password = Faker::Internet.password(min_length: 129)
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが英字だけでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'passwordが数字だけでは登録できない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'passwordが全角では登録できない' do
          @user.password = 'ａａａ１１１'
          @user.password_confirmation = 'ａａａ１１１'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        #// passwordのテスト

        # last_nameのテスト
        it 'last_nameに半角が含まれると登録できない' do
          @user.last_name = 'aa11'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
        it 'last_nameに日本語以外の全角が含まれると登録できない' do
          @user.last_name = 'ＡＡ１１'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
        #// last_nameのテスト

        # first_nameのテスト
        it 'first_nameに半角が含まれると登録できない' do
          @user.first_name = 'aa11'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it 'first_nameに日本語以外の全角が含まれると登録できない' do
          @user.first_name = 'ＡＡ１１'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        #// first_nameのテスト

        # last_name_kanaのテスト
        it 'last_name_kanaに半角が含まれると登録できない' do
          @user.last_name_kana = 'aa11'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
        it 'last_name_kanaにカタカナ以外の全角が含まれると登録できない' do
          @user.last_name_kana = '人ひと'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
        #// last_name_kanaのテスト

        # first_name_kanaのテスト
        it 'first_name_kanaに半角が含まれると登録できない' do
          @user.first_name_kana = 'aa11'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it 'first_name_kanaにカタカナ以外の全角が含まれると登録できない' do
          @user.first_name_kana = '人ひと'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        #// first_name_kanaのテスト


      end
    end
  end

