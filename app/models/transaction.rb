class Transaction < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: { other_than: 0 }
  validates :date, presence: true
  validate :in_future?

  def in_future?
    if date.present? && date.future?
      errors.add(:date, "can't be in the future")
    end
  end
end
