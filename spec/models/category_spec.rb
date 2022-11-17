require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    user = User.create(name: 'Alex', email: 'ujvari65@gmail.com', password: 'password')
    Category.new(
      user_id: user.id,
      name: 'Food',
      description: 'Food expenses',
      icon: 'food'
    )
  end

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should not be valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should be valid without a description' do
    subject.description = nil
    expect(subject).to be_valid
  end
end
