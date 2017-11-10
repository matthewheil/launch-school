def greetings(name, job)
  name = name.join(' ')
  "Hello, #{name}! Nice to have a #{job[:title]} #{job[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
