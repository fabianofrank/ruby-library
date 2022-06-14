require_relative 'person'

class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(classroom, age)
    super(age, 'Unknown', true)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

student = Student.new('1A', 18)
puts student.age
