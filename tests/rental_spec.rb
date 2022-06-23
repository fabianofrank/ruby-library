require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'When instantiating the Rental class' do
    it 'should initiate date, person and book parameters and be able to access them.' do
      person = Person.new(18, 'Name')
      book = Book.new('Title', 'Author')
      date = '2022/08/30'
      rental = Rental.new(date, person, book)
      expect(rental.date).to eq '2022/08/30'
      expect(rental.person).to eq person
      expect(rental.book).to eq book
    end
  end
end
