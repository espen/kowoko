class AttendeesController < ApplicationController
  before_filter :login_required

  respond_to :html, :xml, :json
  
  def create
    @event = Event.find( params[:event_id])
    @attendee = Attendee.create( :event_id => @event.id, :user_id => session[:user_id] )
    redirect_to @event
  end
  
  def destroy
    @attendee = Attendee.find_by_event_id_and_user_id( params[:event_id], session[:user_id] )
    @attendee.destroy
    respond_with @attendee
  end
end