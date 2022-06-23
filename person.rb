require_relative 'nameable'
require_relative 'decorator'
require_relative 'corrector'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_accessor :age, :name, :parent_permission
  attr_reader :id, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rental = []
    @corrector = Corrector.new
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name = @corrector.correct_name(name)
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  private :of_age?
end
