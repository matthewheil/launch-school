# Inheritance is the ability for one class to inherit behaviors from another
# class. The class that inherits behaviors is called the subclass. The class that
# is inherited from is the superclass.

class Animal
  def breathe
    # code
  end
end

class Cat < Animal; end

cat = Cat.new
cat.breathe # the breathe instance method is inherited
