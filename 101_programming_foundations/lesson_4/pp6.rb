def shorten_names!(names, length = 3)
  names.map! { |name| name[0, length] }
end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

shorten_names!(flintstones)

p flintstones