require 'rails_helper'

RSpec.describe Journey, type: :model do
  it "is not valid without attributes" do
    journey = Journey.new
    expect(journey).to_not be_valid
  end

  it "is valid with a attributes" do
    user = FactoryGirl.create(:user)
    card = FactoryGirl.create(:card,user: user)
    journey = FactoryGirl.create(:journey,user: user)
    expect(journey).to be_valid
  end

  it "tube journey created with base fare of 3.20" do
    user = FactoryGirl.create(:user)
    card = FactoryGirl.create(:card,user: user)
    tube_journey = FactoryGirl.create(:journey,via: "tube",user: user)
    expect(tube_journey.fare).to equal 3.20
  end

  it "bus journey created with base fare of 3.20" do
    user = FactoryGirl.create(:user)
    card = FactoryGirl.create(:card,user: user)
    bus_journey = FactoryGirl.create(:journey,via: "bus",user: user)
    expect(bus_journey.fare).to equal 1.80
  end

end
