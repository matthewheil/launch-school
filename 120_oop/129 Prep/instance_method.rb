# Instance methods can only be called by an object of the class. Instance methods
# are behaviors of an object of the class.
#
# Class methods can only be called by a class directly. Class methods are defined
# by using self. before the method name, which outside of an instance method
# refers to the class.

class MyClass
  def self.my_class_method
    puts "This is a class method."
  end

  def my_instance_method
    puts "This is an instance method."
  end
end

object = MyClass.new
MyClass.my_class_method
object.my_instance_method

# these will not work - no method error
MyClass.my_instance_method
object.my_class_method
