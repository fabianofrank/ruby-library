require_relative 'app'
require 'json'

module DataStorage
  def save_books
    data = []
    @books.each do |book|
      data << { title: book.title, author: book.author }
      File.write('books.json', JSON.generate(data))
    end
  end

  def load_books
    data = []
    unless File.zero?('books.json')
      JSON.parse(File.read('books.json')).each do |book|
        data << Book.new(book['title'], book['author'])
      end
    end
    data
  end

  def save_people
    data = []
    @people.each do |person|
      data << if person.instance_of?(Student)
                { class: person.class.name, id: person.id, age: person.age, name: person.name,
                  parent_permission: person.parent_permission }
              else
                { id: person.id, age: person.age, name: person.name, specialization: person.specialization }
              end
      File.write('people.json', JSON.generate(data))
    end
  end

  def load_people
    data = []
    unless File.zero?('people.json')
      JSON.parse(File.read('people.json')).each do |person|
        data << if person['class'] == 'Student'
                  Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
                else
                  Teacher.new(person['age'], person['name'], person['specialization'])
                end
      end
    end
    data
  end

  def save_rentals
    data = []
    @rentals.each do |rental|
      data << { id: rental.person.id, date: rental.date, person: rental.person, book: rental.book }
      File.write('rentals.json', JSON.generate(data))
    end
  end

  def load_rentals
    data = []
    unless File.zero?('rentals.json')
      JSON.parse(File.read('rentals.json')).each do |_rental|
        puts load_people['person']['id']
      end
    end
    data
  end
end
