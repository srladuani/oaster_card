feature 'Journey index page' do
  
  # Scenario: Journey index page
  #   Without signed in
  #   When I visit the journey index page
  #   Then I am redirected to login page with 
  #   Message: You need to sign in or sign up before continuing.
  scenario 'visit journeys without login' do
    visit journeys_path
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  # Scenario: Journey index page
  #   Wit signed in user
  #   When I visit the journey index page
  #   Then I am redirected to journey index page with 
  #   Text: Listing journeys.
  scenario 'visit journeys with login' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit journeys_path
    expect(page).to have_content "Listing journeys"
  end

end