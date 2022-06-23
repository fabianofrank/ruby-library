require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'When instantiating the Classroom class' do
    it 'should initiate label parameter and be able to access it.' do
      classroom = Classroom.new('Label')
      expect(classroom.label).to eq 'Label'
    end

    it 'should be able add_student(age, name) to the classroom' do
      classroom = Classroom.new('1A')
      student = Student.new(18, 'Name')
      classroom.add_student(student)
      expect(student.classroom.label).to eq '1A'
    end
  end
end
