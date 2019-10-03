class Person
  def initialize(name)
    @name = name
  end

  def show_name
    name
  end
end

Person.attr_reader(:name)
bob = Person.new('Bob')
# bob.name # => NoMethodError: private method 'name'
bob.show_name # => 'Bob'
