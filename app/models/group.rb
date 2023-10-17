class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :purchases, join_table: 'groups_purchases'

  def sum_amount
    purchases.sum(&:amount)
  end
end
