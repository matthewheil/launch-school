# attr_writer creates a setter method. This instance method is used to assign a value to an instance variable.
# attr_reader creates a getter method. This instance method is used to retrieve the value of an instance variable.
# attr_accessor creates both a setter and getter method.

class Dog
  attr_reader :breed
  attr_writer :weight
  attr_accessor :name

  def initialize(breed, age, name)
    @breed = breed
    @age = age
    @name = name
  end

  def age # custom getter method
    "Hershey is #{@age} in people years and #{@age * 7} in dog years."
  end
end

hershey = Dog.new('Poodle', 14, 'Hershey')
p hershey.breed # => 'Poodle'
p hershey
hershey.weight = 11 # calls setter method using syntactical sugar
p hershey
p hershey.age
p hershey.name
hershey.name = 'Hershman'
p hershey.name
