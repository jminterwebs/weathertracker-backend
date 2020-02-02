# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
#
# class TestJob
#   def perform
#     puts 'Test!'
#   end
# end
#
# Crono.perform(TestJob).every 2.days, at: '15:30'
#

require 'rake'

Rails.app_class.load_tasks

class GetWeather
  def perform
    Rake::Task['crono:get_weather'].invoke
  end
end

Crono.perform(GetWeather).every 1.day, at: {hour: 2, min: 15}
