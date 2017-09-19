HOURS_IN_DAY = 24
MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR

def time_of_day(total_minutes)
  total_minutes = total_minutes % MINUTES_IN_DAY
  hours, minutes = total_minutes.divmod(MINUTES_IN_HOUR)
  "#{format('%02d', hours)}:#{format('%02d', minutes)}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
