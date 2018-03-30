class Users::Omniauth
  def initialize(auth)
    @auth = auth
  end

  def user
    find_user_by_uid || update_user_by_email || create_user
  end

  private

  attr_reader :auth

  def find_user_by_uid
    User.find_by(provider: auth.provider, uid: auth.uid)
  end

  def update_user_by_email
    user_by_email.update(provider: auth.provider, uid: auth.uid) if user_by_email.present?
  end

  def user_by_email
    @user_by_email ||= User.find_by(email: auth.info.email)
  end

  def create_user
    User.create!(
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0, 20],
      confirmed_at: Time.zone.now
    )
  end
end