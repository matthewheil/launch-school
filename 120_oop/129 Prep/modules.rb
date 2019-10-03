# Classes can only inherit from one superclass. Modules provide a way to group
# methods and mix them into classes providing a form of multiple inheritance.
# Modules also provide name spacing.

module Swimmable
  def swim
    puts "I'm swimming!"
  end
end

class Animal; end # can't implement the swim method here because all subclasses don't swim

class Fish < Animal
  include Swimmable
end

class Reptile < Animal; end

class Iguana < Reptile
  include Swimmable
end

class Tortoise < Reptile; end

dog = Dog.new
fish = Fish.new
dog.swim
fish.swim
