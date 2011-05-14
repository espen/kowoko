class EventsController < ApplicationController
  def index
    @events = Event.limit(20)
  end
  
  def show
    @event = Event.find( params[:id])
  end

  def new
    @event = Event.new()
  end

  def create
    logger.info "CREATE"
    @event = Event.create( params[:event])
    redirect_to @event
  end
  
  def destroy
    @event = Event.find( params[:id] )
    @event.destroy
  end
end
