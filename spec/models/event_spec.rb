require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { create(:event) }

  it "belongs to a creator" do
    expect(event.creator).to be_present
  end

  it "can have attendees" do
    user = create(:user)
    event.attendees << user
    expect(event.attendees).to include(user)
  end

  describe ".past" do
    it "returns past events" do
      past_event = create(:event, date: 2.days.ago)
      expect(Event.past).to include(past_event)
    end
  end

  describe ".upcoming" do
    it "returns upcoming events" do
      upcoming = create(:event, date: 2.days.from_now)
      expect(Event.upcoming).to include(upcoming)
    end
  end
end