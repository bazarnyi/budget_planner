require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is database authenticable' do
    user = create(:user)

    expect(user.valid_password?(user.password)).to be_truthy
  end
end
