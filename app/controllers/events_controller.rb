class EventsController < ApplicationController
    before_action :authenticate_user!
    def index
        @past_events = Event.past
        @upcoming_events = Event.upcoming
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to @event, notice: "Event was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
    @event = Event.find(params[:id])

        if @event.private? && !(@event.creator == current_user || @event.invited_users.include?(current_user))
            redirect_to events_path, alert: "You are not invited to this private event."
        end
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :location, :date)
    end
end
