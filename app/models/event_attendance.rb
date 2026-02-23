class EventAttendance < ApplicationRecord
  belongs_to :attendees
  belongs_to :attended_events
end
