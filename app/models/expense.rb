class Expense < ActiveRecord::Base
  attr_accessible :amount, :comment
  belongs_to :user
  validates :user_id, presence: true
  validates :amount, presence: true
end
