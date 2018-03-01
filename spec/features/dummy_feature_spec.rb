feature 'Dummy feature', js: true do
  scenario 'This is first scenario' do
    pending 'This test should fails thus there is no routing specified yet'
    visit '/'
    expect(page).to have_content 'Hello World!'
  end
end