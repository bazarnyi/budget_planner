require 'rails_helper'

RSpec.describe Envelop, type: :model do
  let(:envelop) { build(:envelop, :balance) }

  it 'has a valid factory' do
    expect(envelop).to be_valid
  end

  it { expect(envelop).to validate_presence_of(:category) }
  it { expect(envelop).not_to allow_value(nil).for(:category) }
  it { expect(envelop).to belong_to(:user) }
end
