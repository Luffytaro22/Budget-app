class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :purchases, join_table: 'groups_purchases'

  # Validations
  validates :name, :icon, presence: true
  validates :name, length: { maximum: 20 }

  def sum_amount
    purchases.sum(&:amount)
  end
end
