# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :update, :destroy], Category do |category|
      category.user == user
    end

    can [:read, :update, :destroy], Expense do |expense|
      expense.user == user
    end

    can :create, Category
    can :create, Expense
  end
end
