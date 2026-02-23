class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          # Events this user created
          has_many :created_events,
           foreign_key: :creator_id,
           class_name: "Event"

  # Events this user is attending
  has_many :event_attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendances, source: :attended_event

  # Invitations
  has_many :invitations
  has_many :invited_events, through: :invitations, source: :event
end
end
