# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them

RSpec.feature "Enter players" do
  scenario "players submit their names" do
    sign_in
    expect(page).to have_text("JACK vs DANIEL")
  end
end

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points

RSpec.feature "See Hit Points" do
  scenario "view opponent's hit points" do
    sign_in
    expect(page).to have_content("Daniel: 60 HP")
  end
end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation

RSpec.feature "Attack" do
  scenario "attack opponent" do
    sign_in
    click_link "Attack"
    expect(page).to have_content("Jack attacked Daniel!")
  end
end

# As Player 1,
# So I can start to win a game of Battle,
# I want my attack to reduce Player 2's HP

RSpec.feature "Attack" do
  scenario "reduces opponent's hit points" do
    sign_in
    click_link "Attack"
    click_link "See scores"
    expect(page).to have_content("Daniel: 50 HP")
    expect(page).not_to have_content("Daniel: 60 HP")
  end
end

# As two Players,
# So we can continue our game of Battle,
# We want to switch turns

RSpec.feature "Switching" do
  scenario "at the start" do
    sign_in
    expect(page).to have_content "Jack's turn!"
  end
end

RSpec.feature "Switching" do
  scenario "after first turn" do
    sign_in
    click_link "Attack"
    click_link "See scores"
    expect(page).to have_content "Daniel's turn!"
    expect(page).not_to have_content "Jack's turn!"
  end
end

# As Player 1,
# So I can see how close I am to losing,
# I want to see my own hit points

RSpec.feature "View own hit points" do
  scenario 'see Player 1 hit points' do
      sign_in
      expect(page).to have_content 'Jack: 60 HP'
    end
end
