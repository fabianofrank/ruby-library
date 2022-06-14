require_relative 'decorator'

class TrimmerDecorator < Decorator
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name[0...10]
  end
end
