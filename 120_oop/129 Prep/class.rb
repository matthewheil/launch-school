# Classes are the blueprint of objects and contain instance methods for the
# behaviors of those objects.

class MyClass
  def behavior1
    # code
  end

  def behavior2
    # code
  end
end

object = MyClass.new
p object.public_methods(false)
