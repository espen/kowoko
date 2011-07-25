class CitiesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    if params[:name]
      @cities = City.where('name LIKE ?', params[:name] + '%' )
    else
      @cities = City.limit(20)
    end
    respond_with @cities
  end
  
  def show
    @city = City.find_by_slug( params[:id] )
    @events = @city.events.limit(20)
    respond_with @city
  end

end