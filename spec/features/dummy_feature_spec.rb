feature 'Dummy feature', js: true do
  scenario 'This is first scenario' do
    visit '/'
    sleep 3
    expect(page.current_url).to include '/'
  end
end