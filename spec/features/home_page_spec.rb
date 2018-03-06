feature 'Home Page visit', js: true do
  scenario 'Unregistered visitor visits home page' do
    visit '/'
    expect(page).to have_content 'Hello World!'
  end
end