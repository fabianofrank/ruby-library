require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_person
    puts 'Do you want to create a student (1) os teacher (2)? [Input the number]:'
    selection = gets.chomp.strip.to_i
    case selection
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.strip.to_i
    print 'Name: '
    name = gets.chomp.strip.to_s
    print 'Parent Permission [Y/N]: '
    parent_permission = gets.chomp.strip.to_s == 'y'
    student = Student.new(age, name, parent_permission: parent_permission)
    @people.push(student)
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.strip.to_i
    print 'Name: '
    name = gets.chomp.strip.to_s
    print 'Specialization: '
    specialization = gets.chomp.strip.to_s
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Teacher created successfully'
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}\n"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip.to_s
    print 'Author: '
    author = gets.chomp.strip.to_s
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}\nAuthor: #{book.author}\n\n"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "\n#{index}) Title: #{book.title}, Author: #{book.author}\n"
    end
    select_book = gets.chomp.strip.to_i
    @people.each_with_index do |person, index|
      puts "\n#{index}) [#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}\n"
    end
    select_person = gets.chomp.strip.to_i
    print 'Date [YYYY/MM/DD]: '
    date = gets.chomp.strip.to_s
    @rentals << Rental.new(date, @people[select_person], @books[select_book])
    puts 'Rental Created Successfully'
  end

  def list_rental
    print 'ID of person: '
    id = gets.chomp.strip.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
  end
end