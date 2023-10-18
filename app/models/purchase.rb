class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups, join_table: 'groups_purchases'

  # Validations
  validates :name, :amount, presence: true
  validates :name, length: { maximum: 30 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
