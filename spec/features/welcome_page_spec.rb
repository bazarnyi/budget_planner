feature 'Welcome Page interaction', js: true do
  let(:welcome_page) { WelcomePage.new }
  before(:each) { welcome_page.load }

  scenario 'Unregistered visitor successfully visits welcome page' do
    expect(welcome_page).to have_content 'WELCOME TO BUDGET PLANNER'
    expect(welcome_page).to have_sign_in_btn
    expect(welcome_page).to have_sign_up_btn

    expect(welcome_page.menu).to have_sign_in_link
    expect(welcome_page.menu).to have_sign_up_link
  end
end