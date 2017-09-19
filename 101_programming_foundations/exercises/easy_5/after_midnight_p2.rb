MINUTES_IN_DAY = 24 * 60
MINUTES_IN_HOUR = 60

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  (hours * MINUTES_IN_HOUR + minutes) % MINUTES_IN_DAY
end

def before_midnight(time)
  delta_minutes = MINUTES_IN_DAY - after_midnight(time)
  delta_minutes = 0 if delta_minutes == MINUTES_IN_DAY
  delta_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
