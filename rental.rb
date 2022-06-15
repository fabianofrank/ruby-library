class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date

    @person = person
    person.rental << self

    @book = book
    book.rental << self
  end

  def person=(person)
    @person = person
    person.rental.push(self) unless person.rental.include?(self)
  end

  def book=(book)
    @book = book
    book.rental.push(self) unless book.rental.include?(self)
  end
end
