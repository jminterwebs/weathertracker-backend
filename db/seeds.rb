# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

  if Location.count == 0

    la = Location.new
    la.name = "Los Angels"
    la.latitude = 37.8267
    la.longitude = -122.4233
    la.save

    ny = Location.new
    ny.name = "New York"
    ny.latitude = 40.7127
    ny.longitude = -74.0059
    ny.save
  end




if Day.count == 0

  la = Location.find(1)
  ny = Location.find(2)


  def generate_seed_data(location)
    client = DarkskyWeather::Api::Client.new
    lat = location.latitude
    long = location.longitude
    30.times { |i|
      weather = client.get_weather(lat: lat, lng: long, timestamp: i.days.ago.to_i)
      day = Day.new
      day.avg_temp = weather.currently.apparent_temperature
      day.dew_point = weather.currently.dew_point
      day.humidity = weather.currently.humidity
      day.pressure = weather.currently.pressure
      day.wind_speed = weather.currently.wind_speed
      day.wind_gust = weather.currently.wind_gust
      day.wind_bearing = weather.currently.wind_bearing
      day.cloud_cover = weather.currently.cloud_cover
      day.uv_index = weather.currently.uv_index
      day.visibility = weather.currently.visibility
      day.ozone = weather.currently.ozone
      day.date = DateTime.strptime( weather.currently.time.to_s ,'%s')
      day.location_id = location.id
      day.save
    }
  end

  generate_seed_data(la)
  generate_seed_data(ny)

end