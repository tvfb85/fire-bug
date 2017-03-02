# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them

RSpec.feature "Enter players" do
  scenario "players submit their names" do
    visit '/'
    fill_in :player_one_name, :with => "Jack"
    fill_in :player_two_name, :with => "Daniel"
    click_button "Submit players"
    expect(page).to have_text("Jack vs Daniel")
  end
end

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points

RSpec.feature "See Hit Points" do
  scenario "view opponent's hit points" do
    visit '/'
    fill_in :player_one_name, :with => "Jack"
    fill_in :player_two_name, :with => "Daniel"
    click_button "Submit players"
    expect(page).to have_content("Daniel: 60 HP")
  end
end
