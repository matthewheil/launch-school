# Objects are instantiated from classes and save the state of the object.

class Person
  def initialize(weight, hair_color)
    @weight = weight
    @hair_color = hair_color
  end
end

bob = Person.new(180, 'brown')
p bob

sue = Person.new(160, 'black')
p sue
