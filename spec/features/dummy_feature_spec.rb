feature 'Dummy feature', js: true do
  scenario 'This is first scenario' do
    visit '/'
    expect(page).to have_content 'Hello World!'
  end
end