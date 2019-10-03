# Calling a setter method inside the class definition requires the keyword self,
# which specifies the receiver. Ruby now knows that this is a method call and not
# the creation of a local variable.
# Calling a getter method does not require specifying the receiver. 
# You invoke the getter instance method by calling the method name.

class Dog
  attr_writer :weight
  attr_reader :weight

  def weigh_dog(value)
    self.weight = value # calls setter method
    weight = value # creates local variable
  end
  
  def display_weight # uses string interpolation to output instance variable weight
    puts "The dog weighs #{weight} pounds." # does not require self keyword; interpolates weight to `nil` if ivar is not set before calling display_weight
  end
end
