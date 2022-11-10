class Nameable
  def correct_name
    raise 'NotImplementedError'
  end
end

class BaseDecorator < Nameable
  attr_accessor :name

  def initialize(name)
    super()
    @name = name
  end

  def correct_name
    @name.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @name.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @name.correct_name.slice(0..9)
  end
end
