class EventsController < ApplicationController
  respond_to :html, :xml, :json
  
  before_filter :login_required, :only => [:new, :create, :destroy]
  
  def index
    if params[:city_id]
      @city = City.find_by_slug( params[:city_id] )
      @events = @city.events.limit(20)
    else
      @events = Event.order('created_at desc').limit(20)
    end
    respond_with @events
  end
  
  def show
    @event = Event.find( params[:id])
    respond_with @event
  end

  def new
    @event = Event.new()
    @city = City.find_by_slug( params[:city_id] )
    @event.city = @city
    @event.city_name = @city.name
    respond_with @event
  end

  def create
    @event = Event.create( params[:event])
    @event.creator = @current_user
    @event.save
    respond_with @event
  end
  
  def destroy
    @event = Event.find( params[:id] )
    @event.destroy
    respond_with @event
  end
end
