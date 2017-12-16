require 'rails_helper'

RSpec.describe Card, type: :model do
  it "is not valid without attributes" do
    card = Card.new
    expect(card).to_not be_valid
  end

  it "is valid with a attributes" do
    user = FactoryGirl.create(:user)
    card = FactoryGirl.create(:card,user: user)
    expect(card).to be_valid
  end
end
