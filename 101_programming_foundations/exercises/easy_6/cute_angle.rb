DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def dms(degrees_num)
  degrees = degrees_num.to_i
  if degrees >= 0
    minutes = (degrees_num % 1) * MINUTES_PER_DEGREE
  else
    minutes = (-degrees_num % 1) * MINUTES_PER_DEGREE
  end
  seconds = (minutes % 1) * SECONDS_PER_MINUTE
  format("%01d#{DEGREE}%02d'%02d\"", degrees, minutes, seconds)
end

puts dms(30)       # == "30°00'00\""
puts dms(76.73)    # == "76°43'48\""
puts dms(254.6)    # == "254°36'00\"" # this one is off by a second
puts dms(93.034773)# == "93°02'05\""
puts dms(0)        # == "0°00'00\""
puts dms(360)      # == "360°00'00\"" || dms(360) == "0°00'00\""
puts dms(-1)       # == "-1°00'00\""
puts dms(-1.25)    # == "-1°15'00\""
puts dms(1.25)     # == "1°15'00\""
puts dms(720)      # == "720°00'00\""
