class Event < ApplicationRecord
    # Creator of this event
    belongs_to :creator, class_name: "User"

    # Attendees of this event
    has_many :event_attendances, foreign_key: :attended_events_id
    has_many :attendees, through: :event_attendances, source: :attendee

    # Scopes
  scope :past, -> { where("date < ?", Time.current).order(date: :desc) }
  scope :upcoming, -> { where("date >= ?", Time.current).order(date: :asc) }

   # Invitations
  has_many :invitations
  has_many :invited_users, through: :invitations, source: :user

end
