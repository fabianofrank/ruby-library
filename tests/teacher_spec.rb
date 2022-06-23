require_relative '../teacher'

describe Teacher do
  context 'When instantiating the Teacher class' do
    it 'should initiate age, name and specialization parameters and be able to access them.' do
      teacher = Teacher.new(18, 'Name', 'Specialization')
      expect(teacher.age).to eq 18
      expect(teacher.name).to eq 'Name'
      expect(teacher.specialization).to eq 'Specialization'
    end
  end
end
