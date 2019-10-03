class MyClass; end

object = MyClass.new
p !!object # => true
p !!nil # => false
p !!false # => false
p true.class # => TrueClass
p false.class # => FalseClass
