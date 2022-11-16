class Expense < ApplicationRecord
  belongs_to :user

  has_many :expense_categories, dependent: :destroy, foreign_key: 'expense_id'
  has_many :categories, through: :expense_categories, dependent: :destroy, foreign_key: 'expense_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
