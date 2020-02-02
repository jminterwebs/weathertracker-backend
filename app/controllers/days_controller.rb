class DaysController < ApplicationController
 def index
        render json: DaySerializer.new(Day.all)
 end




end
