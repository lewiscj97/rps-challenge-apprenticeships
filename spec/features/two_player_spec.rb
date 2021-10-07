feature 'home page' do
  scenario 'visiting home page should ask user to enter their name' do
    visit '/two_player'
    expect(page).to have_content('Player 1:')
    expect(page).to have_content('Player 2:')
  end

  scenario 'two players entered, able to submit their names' do
    visit '/two_player'
    fill_in "player1", with: "foo"
    fill_in "player2", with: "bar"
    click_button "Submit"
    expect(page).to have_content('Enter your move, foo:')
  end
end