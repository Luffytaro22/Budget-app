class GroupsPurchase < ApplicationRecord
  belongs_to :group
  belongs_to :purchase
end