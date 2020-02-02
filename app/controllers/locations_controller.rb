class LocationsController < ApplicationController

  def index
    render json: LocationSerializer.new(Location.all).serialized_json
  end

  def show
    render json: LocationSerializer.new(Location.find(params['id']))
  end

end
