require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :parent_permission

  def initialize(specialization, age)
    super(age, 'Unknown', true)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
