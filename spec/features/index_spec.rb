feature 'home page' do
  scenario 'lets user choose single player' do
    visit '/'
    click_button("Single Player")
    expect(page).to have_content('Enter your name:')
  end
end
