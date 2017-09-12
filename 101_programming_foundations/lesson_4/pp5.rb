def name_starts_with(names, chars)
  names.index { |name| name[0, chars.length] == chars }
end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p name_starts_with(flintstones, "Be")
p name_starts_with(flintstones, "Pebb")
p name_starts_with(flintstones, "B")
p name_starts_with(flintstones, "Ze")