class Users::Omniauth
  def initialize(auth)
    @auth = auth
  end

  def user
    find_user || create_user
  end

  private

  attr_reader :auth

  def find_user
    User.where(provider: auth.provider, uid: auth.uid).first
  end

  def create_user
    User.where(provider: auth.provider, uid: auth.uid).create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
end