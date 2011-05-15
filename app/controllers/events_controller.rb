class EventsController < ApplicationController
  respond_to :html, :xml, :json
  
  before_filter :login_required, :only => [:new, :create, :destroy]
  
  def index
    @events = Event.limit(20)
    respond_with @events
  end
  
  def show
    @event = Event.find( params[:id])
    respond_with @event
  end

  def new
    @event = Event.new()
    respond_with @event
  end

  def create
    @event = Event.create( params[:event])
    @event.user_id = @current_user.id
    @event.save
    respond_with @event
  end
  
  def destroy
    @event = Event.find( params[:id] )
    @event.destroy
    respond_with @event
  end
end
