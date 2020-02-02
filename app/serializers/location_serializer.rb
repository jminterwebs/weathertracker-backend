class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :latitude, :longitude,:days
  has_many :days
end
