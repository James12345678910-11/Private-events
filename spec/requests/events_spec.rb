require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:user) { create(:user) }
  let(:event) { create(:event, creator: user) }

  before do
    sign_in user
  end

  it "shows events index" do
    get events_path
    expect(response).to have_http_status(:ok)
  end

  it "creates an event" do
    post events_path, params: {
      event: {
        title: "Test",
        description: "Desc",
        location: "City",
        date: Time.now
      }
    }

    expect(Event.last.title).to eq("Test")
  end
end