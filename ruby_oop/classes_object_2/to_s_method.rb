class Computer
  attr_reader :cpu, :storage

  def initialize(cpu, storage)
    @cpu = cpu
    @storage = storage
  end

  def to_s
    "TO_S... CPU = #{@cpu}, Storage = #{@storage}"
  end

  def inspect
    "INSPECT... CPU = #{@cpu}, Storage = #{@storage}"
  end

  # def to_s
  # "[1, 2, 3]"
  # end
end

elitebook = Computer.new('Intel I9', 512)
puts elitebook
puts ''
p elitebook
puts ''
puts elitebook.cpu
puts ''
puts elitebook
