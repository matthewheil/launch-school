# Fake operators are instance methods that look like operators. For instance, + or
# == look like operators but are actually instance methods. == is defined in the
# BasicObject class, which all classes in Ruby inherit from. Each subclass
# overrides the == method to define. Fake operators are methods in Ruby that look
# like an operator. For example + is actually a method. The code 1 + 2 is actually
# calling the plus method on 1 and passing in 2 as an argument like this 1.+(2).
# he return of that method is 3. == is also a method and can be overridden to
# specify how one object will be compared to another object.what values are
# compared.

puts 1.+(2) # => 3

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other_person)
    @name == other_person.name
  end
end

bob = Person.new('bob')
robert = Person.new('bob')
puts bob == robert # => true
