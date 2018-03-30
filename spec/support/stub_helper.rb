module StubHelper
  def stub_omniauth_env(provider)
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = stubbed_auth(provider)
  end

  private

  def stubbed_auth(provider)
    double(
        provider: provider,
        uid: stubbed_auth_uid(provider),
        info: stubbed_auth_info
    )
  end

  def stubbed_auth_uid(provider)
    case provider
    when 'github'
      Faker::Number.number 8
    when 'google_oauth2'
      Faker::Number.number 21
    else
      raise 'Only "github" and "google_oauth2" omniauth are currently supported'
    end
  end

  def stubbed_auth_info
    double(email: Faker::Internet.email)
  end
end