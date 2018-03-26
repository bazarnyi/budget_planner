require 'rails_helper'

RSpec.describe HomePageController do
  describe 'GET #index' do
    let(:do_request) { get :index }

    context 'not logged in user' do
      it 'redirects to WelcomeController' do
        do_request
        expect(response).to have_http_status 302
        expect(response).to redirect_to controller: 'welcome', action: 'index'
      end
    end

    context 'logged in user' do

      user = FactoryBot.create(:user)

      it 'renders the index template' do
        sign_in user

        do_request
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end
    end
  end
end