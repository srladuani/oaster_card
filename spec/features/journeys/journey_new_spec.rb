feature 'Journey new page' do
  
  # Scenario: Journey new page
  #   Without signed in
  #   When I visit the journey new page
  #   Then I am redirected to login page with 
  #   Message: You need to sign in or sign up before continuing.
  scenario 'visit new journey without login' do
    visit new_journey_path
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  # Scenario: Journey new page
  #   With signed in user
  #   When I visit new page, without adding card
  #   Then I am redirected to cards page with
  #   Text: "Please add card or recharge your your card!"
  scenario 'visit journeys with login' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit new_journey_path
    expect(page).to have_content "Please add card or recharge your your card!"
  end

  # Scenario: Journey new page
  #   With signed in user and card added with min balance
  #   When I visit new page, with card added
  #   Then It will open a new journey page
  scenario 'visit journeys with login and card added' do
    user = FactoryGirl.create(:user)
    card = FactoryGirl.create(:card,user: user)
    signin(user.email, user.password)
    visit new_journey_path
    expect(page).to have_content "New journey"
  end

end