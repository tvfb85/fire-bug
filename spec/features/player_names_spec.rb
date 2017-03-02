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
