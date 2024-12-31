require_relative 'drift'

class Ferrari # < Cars
  attr_accessor :model, :year, :color

  def initialize(model, year, color)
    self.model = model
    self.year = year
    self.color = color
  end
  include Driftable
end

my_ferrari = Ferrari.new('288 GTO', 1985, 'Red')
puts ''
my_ferrari.drift
puts ''

p Ferrari.ancestors
