namespace :crono do
  desc 'Update weather'
  task :get_weather => :environment do

    la = Location.find(1)
    ny = Location.find(2)

    def update_yesterdays_weather(location)
      client = DarkskyWeather::Api::Client.new
      lat = location.latitude
      long = location.longitude
      weather = client.get_weather(lat: lat, lng: long, timestamp: 1.days.ago.to_i)
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
    end

    update_yesterdays_weather(la)
    update_yesterdays_weather(ny)

  end
end