class CitiesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @cities = City.limit(20)
    respond_with @cities
  end
  
  def show
    @city = City.find_by_slug( params[:id] )
    @events = @city.events.limit(20)
    respond_with @city
  end

end