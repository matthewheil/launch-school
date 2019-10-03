# Defining a method with self in a class creates a class method. Calling a method
# with self inside of an instance method references the caller and invokes the
# method based on that caller object. Setting an instance variable that has a
# setter method requires using the self keyword to prevent creating a local
# variable.

class Insect
  def self.info
    puts "This is the Insect class."
  end

  def set_type(type)
    self.type = type
  end

  def show_type
    self.type # => raises no method error; can't specify a calling object for a private method except for setter methods
    puts @type
  end

  private

  def type
    @type
  end

  def type=(value)
    @type = value
  end
end

beetle = Insect.new
beetle.set_type('beetle')
beetle.show_type
