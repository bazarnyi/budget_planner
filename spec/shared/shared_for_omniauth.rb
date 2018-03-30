RSpec.shared_examples 'finds ouath user' do
  it 'finds user' do
    expect(auth_service.user.uid).to eq(user.uid)
  end
end

RSpec.shared_examples 'creates ouath user' do
  it 'creates user' do
    auth_service.user
    expect(User.last.email).to eq(user.email)
  end
end

RSpec.shared_examples 'updates ouath user' do
  it 'creates user' do
    auth_service.user
    expect(User.find(registered_user.id).uid).to eq(user.uid)
  end
end