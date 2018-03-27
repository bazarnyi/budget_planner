require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController do
  describe 'GET #github' do
    let(:do_request) { get :github }

    before do
      stub_omniauth_env 'github'
      do_request
    end

    it 'redirects to root_path' do
      expect(controller).to set_flash[:notice]
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET #google_oauth2' do
    let(:do_request) { get :google_oauth2 }

    before do
      stub_omniauth_env 'google_oauth2'
      do_request
    end

    it 'redirects to root_path' do
      expect(controller).to set_flash[:notice]
      expect(response).to redirect_to root_path
    end
  end
end