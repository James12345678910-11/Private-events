require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
  it "connects a user to an event" do
    user = create(:user)
    event = create(:event)

    attendance = EventAttendance.create(
      attendee: user,
      attended_event: event
    )

    expect(attendance.attendee).to eq(user)
    expect(attendance.attended_event).to eq(event)
  end
end