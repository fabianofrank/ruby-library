require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  context 'When instantiating the Person class' do
    it 'should initiate age and name parameters and be able to access them.' do
      person = Person.new(18, 'Name')
      expect(person.age).to eq 18
      expect(person.name).to eq 'Name'
    end

    it 'should have a method can_use_services? that checks if it has of_age? or a valid parent_permission' do
      person = Person.new(18, 'Name', parent_permission: false)
      expect(person.can_use_services?).to eq true
    end

    it 'should have a method correct_name that capitalizes and trims the name of the person object' do
      person = Person.new(18, 'maxmillianus')
      expect(person.correct_name).to eq 'Maxmillian'
    end

    it 'should have a method add_rental that adds a rental for the person' do
      person = Person.new(18, 'Name')
      book = Book.new('Title', 'Author')
      date = '2022/08/30'
      person.add_rental(date, book)
      expect(person.rental.length).to be 1
    end
  end
end
