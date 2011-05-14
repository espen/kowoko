class AttendeeController < ApplicationController
  respond_to :xml, :json
  
  def create
    @attendee = Attendee.create( :event_id => params[:event_id] )
    @attendee.user_id = session[:user_id]
    @attendee.save
    respond_with @attendee
  end
  
  def destroy
    @attendee = Attendee.find_by_event_id_and_user_id( params[:event_id], session[:user_id] )
    @attendee.destroy
    respond_with @attendee
  end
end