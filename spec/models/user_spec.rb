require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have password and password confirmation match' do
      @user = User.create(password: "123admin", password_digest: "123admin")
      expect(@user.password).to eq(@user.password_digest)
    end

    it 'should have password and password confirmation not match' do
      @user = User.create(password: "123admin", password_digest: "admin123")
      expect(@user.password).not_to eq(@user.password_digest)
    end

    it 'should have a unique email' do
      @user = User.new
      @user.email = "adminadmin@gmail.com"

      User.create(email: 'adminadmin@gmail.com', firstname: 'Adamin', lastname: '123', password: 'admin123', password_digest: 'admin123')
      @existingUser = User.create(email: 'adminadmin@gmail.com', firstname: 'Adamin', lastname: '123', password: 'admin123', password_digest: 'admin123')

      expect(@existingUser.errors.full_messages).not_to be_empty
      puts @existingUser.errors.full_messages
    end

    it 'should have all required params' do
      @user = User.create(email: 'adminaasdfdmin@gmail.com', firstname: 'Adamin', lastname: '123', password: 'admin123', password_digest: 'admin123')
      expect(@user.errors.full_messages).to be_empty
    end

    it 'should have a password with minimum length' do
      @user = User.create(email: 'adminadmin@gmail.com', firstname: 'Adamin', lastname: '123', password: 'ad', password_digest: 'ad')
      expect(@user.errors.full_messages).not_to be_empty
      puts @user.errors.full_messages
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should have be able to authenticate with email and password' do
      @user = User.create(email: 'adminadmin@gmail.com', firstname: 'Adamin', lastname: '123', password: 'admin123', password_digest: 'admin123')
      @result = User.authenticate_with_credentials(@user.email, @user.password)

      expect(@result).not_to be_nil
    end

    it 'should have be able to authenticate with email with spaces' do
      @user = User.create(email: ' adminadmin@gmail.com ', firstname: 'Adamin', lastname: '123', password: 'admin123', password_digest: 'admin123')
      @result = User.authenticate_with_credentials(@user.email, @user.password)

      expect(@result).not_to be_nil
    end

    it 'should have be able to authenticate with email with wrong cases' do
      @user = User.create(email: 'AdmInadmin@gmail.com', firstname: 'Adamin', lastname: '123', password: 'admin123', password_digest: 'admin123')
      @result = User.authenticate_with_credentials(@user.email, @user.password)

      expect(@result).not_to be_nil
    end
  end
end
