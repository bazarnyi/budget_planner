class Account < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: true
end
