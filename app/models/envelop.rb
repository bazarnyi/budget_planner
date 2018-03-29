class Envelop < ApplicationRecord
  belongs_to :user

  enum category: %i[balance automobile bank_charges charity education family food
                    gifts household hobbies vacation]

  validates :category, presence: true
end
