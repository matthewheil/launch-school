# The method lookup path is the hierarchy that Ruby uses to search for a method.
# It first looks in the class where the method is called, then looks in the
# modules included (in reverse order of inclusion), then goes up the inheritance
# path and repeats this process.
module Swimmable; end
module Jumpable; end

class Animal
  def breathe
    # code
  end
end

class Reptile < Animal; end

class Iguana < Reptile
  include Swimmable
  include Jumpable

  def attack_with_tail
    # code
  end
end

iguana = Iguana.new
iguana.attack_with_tail
iguana.breathe
p iguana == Iguana.new # => false; retrieves .==() method from BasicObject
