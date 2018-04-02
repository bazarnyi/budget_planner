require 'rails_helper'

RSpec.describe Users::Omniauth do
  describe '.user' do
    context 'when omniauth user exists' do
      let(:auth) { double(provider: user.provider, uid: user.uid) }
      let(:auth_service) { described_class.new(auth) }

      context 'for google' do
        let!(:user) { FactoryBot.create(:user, :google) }

        include_examples 'finds ouath user'
      end

      context 'for github' do
        let!(:user) { FactoryBot.create(:user, :github) }

        include_examples 'finds ouath user'
      end
    end

    context 'when omniauth user does not exist' do
      let(:auth) { double(provider: user.provider, uid: user.uid, info: double(email: user.email)) }
      let(:auth_service) { described_class.new(auth) }

      context 'for google' do
        let!(:user) { FactoryBot.build(:user, :google) }

        include_examples 'creates ouath user'
      end

      context 'for github' do
        let!(:user) { FactoryBot.build(:user, :github) }

        include_examples 'creates ouath user'
      end
    end

    context 'when user exist but with no omniauth' do
      let(:registered_user) { FactoryBot.create(:user) }
      let(:auth) { double(provider: user.provider, uid: user.uid, info: double(email: registered_user.email)) }
      let(:auth_service) { described_class.new(auth) }

      context 'for google' do
        let!(:user) { FactoryBot.build(:user, :google) }

        include_examples 'updates ouath user'
      end

      context 'for github' do
        let!(:user) { FactoryBot.build(:user, :github) }

        include_examples 'updates ouath user'
      end
    end
  end
end