class EventAttendancesController < ApplicationController
    def create
    event = Event.find(params[:event_id])
    current_user.attended_events << event
    redirect_to event
  end

    def show
        @user = User.find(params[:id])
        @attended_events = @user.attended_events
end
