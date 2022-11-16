require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    user = User.create(name: "Alex", email: "ujvari65@gmail.com", password: "password")
    Expense.new(
      user_id: user.id,
      amount: 100,
      name: "Food",
    )
  end

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should not be valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid with a negative amount' do
    subject.amount = -100
    expect(subject).to_not be_valid
  end
end