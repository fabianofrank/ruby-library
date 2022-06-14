require_relative 'nameable'

class Decorator < Nameable
  def intialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
