class DaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :avg_temp,  :dew_point,  :humidity,  :pressure ,  :wind_speed,  :wind_gust ,  :wind_bearing ,  :cloud_cover,  :uv_index ,  :visibility ,  :ozone ,  :date, :location

end
