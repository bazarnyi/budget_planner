feature 'Home Page interaction', js: true do

  let(:home_page) { HomePage.new }
  let(:welcome_page) { WelcomePage.new }
  let(:sign_up_page) { SignUpPage.new }
  let(:sign_in_page) { SignInPage.new }

  before(:each) { home_page.load }

  scenario 'Unregistered visitor got redirected to welcome page' do
    expect(welcome_page).to be_displayed
  end

  scenario 'Unregistered visitor is capable of signing up' do
    user = FactoryBot.build(:user)

    home_page.menu.sign_up_link.click

    expect(sign_up_page).to be_displayed

    sign_up_page.sign_up(user)
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address.'
    expect(page).to have_content 'Please follow the link to activate your account'

    expect(User.last.email).to eq user.email
    expect(User.last.confirmed_at).to be_nil
  end

  scenario 'Confirmed user is capable of signing in' do
    user = FactoryBot.create(:user)
    user.confirm
    expect(User.last.confirmed_at).not_to be_nil

    home_page.menu.sign_in_link.click

    expect(sign_in_page).to be_displayed

    sign_in_page.sign_in(user)

    expect(page).to have_content 'You are logged in! Budget Planner At Your Service'
    expect(home_page.menu).to have_content user.email.upcase
    expect(home_page.menu).to have_edit_profile_link
    expect(home_page.menu).to have_logout_link
  end
end