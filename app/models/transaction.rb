class Transaction < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: { other_than: 0 }
  validates :date, presence: true
  validate :in_future?

  def in_future?
    if date.present? && date > Time.zone.now
      errors.add(:date, "can't be in the future")
    end
  end

  after_create :update_account

  private

  def update_account
    account = Account.where(user_id: user_id).first
    account.amount += amount
    account.save!
  end
end
