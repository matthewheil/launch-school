# Polymorphism is the ability to provide a single interface or method to different
# entities or objects. Inheritance and method overriding is a form of polymorphism
# in Ruby. For instance == is defined in the BasicObject class and overridden in
# subclasses to define specifically what values to compare.

class Animal
  def breathe
    puts "The animal breathes oxygen."
  end
end

class Cat < Animal
  def breathe
    puts "The cat breathes oxygen through its lungs."
  end
end

class Fish < Animal
  def breathe
    puts "The fish breathes oxygen through its gills"
  end
end

cat = Cat.new
fish = Fish.new
cat.breathe # inheritance polymorphism
fish.breathe
