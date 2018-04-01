require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { build(:account) }

  it 'has a valid factory' do
    expect(account).to be_valid
  end

  it { expect(account).to validate_presence_of(:amount) }
  it { expect(account).not_to allow_value(nil).for(:amount) }
  it { expect(account).to belong_to(:user) }
end
