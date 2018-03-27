require 'rails_helper'

RSpec.describe Users::Omniauth do
  describe 'create omniauth connection' do
    context 'existing omniauth user' do
      let(:github_user) { FactoryBot.create(:user, :github) }
      let(:google_user) { FactoryBot.create(:user, :google) }

      it 'finds user' do
        [github_user, google_user].each do |u|
          auth = double(provider: u.provider, uid: u.uid)

          expect(Users::Omniauth.new(auth).user.uid).to eq u.uid
        end
      end
    end

    context 'new omniauth user' do
      let(:github_user) { FactoryBot.build(:user, :github) }
      let(:google_user) { FactoryBot.build(:user, :google) }

      it 'creates new user' do
        [github_user, google_user].each do |u|
          auth = double(provider: u.provider, uid: u.uid, info: double(email: u.email))

          Users::Omniauth.new(auth).user

          expect(User.last.email).to eq u.email
        end
      end
    end

    context 'existing user without omniauth' do
      let(:github_user) { FactoryBot.build(:user, :github) }
      let(:google_user) { FactoryBot.build(:user, :google) }

      it 'creates new user' do
        [github_user, google_user].each do |u|
          user = FactoryBot.create(:user)
          auth = double(provider: u.provider, uid: u.uid, info: double(email: user.email))

          Users::Omniauth.new(auth).user

          expect(User.find(user.id).uid).to eq u.uid
        end
      end
    end
  end
end