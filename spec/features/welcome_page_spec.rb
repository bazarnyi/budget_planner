feature 'Welcome Page interaction', js: true do

  before(:all) { @welcome_page = WelcomePage.new }

  scenario 'Unregistered visitor successfully visits welcome page' do
    @welcome_page.load

    expect(@welcome_page).to have_content 'WELCOME TO BUDGET PLANNER'
    expect(@welcome_page).to have_sign_in_btn
    expect(@welcome_page).to have_sign_up_btn

    expect(@welcome_page.menu).to have_sign_in_link
    expect(@welcome_page.menu).to have_sign_up_link
  end

end