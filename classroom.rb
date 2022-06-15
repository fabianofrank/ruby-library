require_relative 'student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end

class1 = Classroom.new('math_class')
alex = Student.new('1A', 18, 'Alex')

class1.add_student(alex)

puts class1.students.first.name
puts alex.classroom.label
