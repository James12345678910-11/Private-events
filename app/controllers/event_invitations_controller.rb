class EventInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    # Get selected user IDs from the form
    user_ids = params[:event][:user_ids].reject(&:blank?)

    # Create invitation records
    user_ids.each do |uid|
      @event.invitations.find_or_create_by(user_id: uid)
    end

    redirect_to @event, notice: "Users invited successfully!"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end