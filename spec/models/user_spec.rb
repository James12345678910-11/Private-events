require 'rails_helper'

RSpec.describe User, type: :model do
  it "has many created events" do
    association = User.reflect_on_association(:created_events)
    expect(association.macro).to eq(:has_many)
  end

  it "has many attended events" do
    association = User.reflect_on_association(:attended_events)
    expect(association.macro).to eq(:has_many)
  end

  it "is valid with valid attributes" do
    expect(build(:user)).to be_valid
  end
end