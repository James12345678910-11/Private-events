require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it "invites a user to an event" do
    user = create(:user)
    event = create(:event)

    invite = Invitation.create(user: user, event: event)

    expect(invite.user).to eq(user)
    expect(invite.event).to eq(event)
  end
end