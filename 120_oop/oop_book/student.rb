class Student
  attr_reader :name
  
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(name)
    grade > name.grade
  end

  protected
  
  def grade
    @grade
  end
end

bob = Student.new("Bob", 90)
joe = Student.new("Joe", 100)
puts "Well done!" if joe.better_grade_than?(bob)