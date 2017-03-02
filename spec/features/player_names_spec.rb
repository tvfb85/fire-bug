# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them

RSpec.feature "Enter players" do
  scenario "players submit their names" do
    sign_in
    expect(page).to have_text("Jack vs Daniel")
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
