class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:github, :google_oauth2]

  has_many :transactions, dependent: :destroy
  has_many :envelops, dependent: :destroy
end
