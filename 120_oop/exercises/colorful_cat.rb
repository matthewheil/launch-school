class Cat
  COLORS = %w(green purple yellow blue white black orange teal pink)
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello, my name is #{@name}, and I'm a #{COLORS.sample} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
