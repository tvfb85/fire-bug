def sign_in
  visit "/"
  fill_in :player_one_name, :with => "Jack"
  fill_in :player_two_name, :with => "Daniel"
  click_button "Submit players"
end
