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
    @event = Event.create( params[:event])
    @event.user_id = session[:user_id]
    @event.save
    redirect_to @event
  end
  
  def destroy
    @event = Event.find( params[:id] )
    @event.destroy
  end
end
