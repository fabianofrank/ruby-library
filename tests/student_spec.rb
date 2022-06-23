require_relative '../student'

describe Student do
  context 'When instantiating the Student class' do
    it 'should initiate age, name and parent permission parameters and be able to access them.' do
      student = Student.new(18, 'Name', parent_permission: true)
      expect(student.age).to eq 18
      expect(student.name).to eq 'Name'
      expect(student.parent_permission).to eq true
    end
  end
end
