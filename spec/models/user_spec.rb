require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do

    before(:each) do
      @user = FactoryBot.build(:user)
    end

    describe 'signs up' do

      context 'and sign up was successful' do

        it 'user information is valid' do
          expect(@user).to be_valid
        end

        it 'password length is correct' do
          @user.password_confirmation = "qwerty"
          expect(@user).to be_valid
        end

      end # Happy paths sign up

      context 'and sign up failed' do

        it 'email is empty' do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include('Email can\'t be blank')
        end

        it 'email already in database' do
          @user.save
          second_user = FactoryBot.build(:user, email: @user.email)
          second_user.valid?
          expect(second_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'Cannot register if there are duplicate emails' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'password is empty' do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include('Password can\'t be blank')
        end

        it 'password is too short' do
          @user.password = 'abcde'
          @user.password_confirmation = 'abcde'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'password even if password exists_Confirmation cannot be registered if it is empty' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

      end # Sad paths sign up

    end # sign up

  end # End user tests
end # End user model for tests
