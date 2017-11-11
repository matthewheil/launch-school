def initialize_lights(number_of_lights)
  lights = {}
  1.upto(number_of_lights) { |num| lights[num] = false }
  lights
end

def flip_lights(lights)
  count = 1
  loop do
    lights.keys.each { |num| lights[num] = !lights[num] if num % count == 0 }
    break if count >= lights.size
    count += 1
  end
  lights
end

def lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  lights = flip_lights(lights)
  lights.select { |_, v| v == true }.keys
end

p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]