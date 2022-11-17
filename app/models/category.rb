class Category < ApplicationRecord
  belongs_to :user

  has_many :expense_categories, dependent: :destroy, foreign_key: 'category_id'
  has_many :expenses, through: :expense_categories, dependent: :destroy, foreign_key: 'category_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
