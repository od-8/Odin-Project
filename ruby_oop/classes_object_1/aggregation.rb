class Cpu
  def initialize
    puts 'CPU created...'
  end
end

class Gpu
  def initialize
    puts 'GPU created...'
  end
end

class Ram
  def initialize
    puts 'Ram created...'
  end
end

class Storage
  def initialize
    puts 'Storage created...'
  end
end

class Computer
  def initialize(cpu, gpu, ram, storage)
    @cpu = cpu
    @gpu = gpu
    @ram = ram
    @storage = storage
    puts 'Computer created. Contains CPU, GPU, RAM and STORAGE.'
  end
end

my_cpu = Cpu.new
my_gpu = Gpu.new
my_ram = Ram.new
my_storage = Storage.new
Computer.new(my_cpu, my_gpu, my_ram, my_storage)
