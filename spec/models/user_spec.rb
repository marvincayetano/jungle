require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have password and password confirmation match' do
      @user = User.create(password: "123admin", password_digest: "123admin")
      expect(@user.password).to equal(@user.password_digest)
    end

  end
end
