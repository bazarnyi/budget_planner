class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:github, :google_oauth2]

  has_many :transactions, dependent: :destroy
  has_one :account, dependent: :destroy

  after_create :create_account

  private

  def create_account
    Account.create(user_id: id)
  end
end
