require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { build(:transaction) }

  it 'has a valid factory' do
    expect(transaction).to be_valid
  end

  it { expect(transaction).to validate_presence_of(:amount) }
  it { expect(transaction).not_to allow_value(nil).for(:amount) }
  it { expect(transaction).to belong_to(:user) }
end
