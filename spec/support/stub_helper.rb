module StubHelper
  def stub_omniauth_env(provider)
    request.env['devise.mapping'] = Devise.mappings[:user]

    uid = case provider
          when 'github'
            Faker::Number.number 8
          when 'google_oauth2'
            Faker::Number.number 21
          else
            raise 'Only "github" and "google_oauth2" omniauth are currently supported'
          end

    info = double(email: Faker::Internet.email)
    auth = double(provider: provider, uid: uid, info: info)

    request.env['omniauth.auth'] = auth
  end
end