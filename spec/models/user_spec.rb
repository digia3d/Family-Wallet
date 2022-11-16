require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'Alex', email: 'ujvari65@gmail.com', password: 'password') }

  it 'validates presence of name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'validates presence of email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'validates presence of password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it 'validates uniqueness of email' do
    user.save
    user2 = User.new(name: 'Alex', email: 'ujvari65@gmail.com')
    expect(user2).to_not be_valid
  end

  it 'validates length of password' do
    user.password = 'pass'
    expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
