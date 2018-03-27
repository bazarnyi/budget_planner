require 'rails_helper'

RSpec.describe WelcomeController do
  describe 'GET #index' do
    let(:do_request) { get :index }

    it 'renders the index template' do
      do_request
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end
end