class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|

      t.float :avg_temp
      t.float :dew_point
      t.float :humidity
      t.float :pressure
      t.float :wind_speed
      t.float :wind_gust
      t.float :wind_bearing
      t.float :cloud_cover
      t.float :uv_index
      t.float :visibility
      t.float :ozone
      t.timestamp :date
      t.references :location
      t.timestamps
    end
  end
end
