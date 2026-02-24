class EventAttendancesController < ApplicationController
    def create
    event = Event.find(params[:event_id])
    event.attendees << current_user
    redirect_to event
  end

    def show
        @user = User.find(params[:id])
        @attended_events = @user.attended_events
      
    def destroy
    attendance = EventAttendance.find(params[:id])
    attendance.destroy if attendance.attendee == current_user
    redirect_to events_path
  end
end
