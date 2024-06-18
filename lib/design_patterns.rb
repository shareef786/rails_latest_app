## Builder Pateern

class Metric
  attr_accessor :name, :type, :value

  def initialize(name, type, value)
    @name = name
    @type = type
    @value = value
  end
end

Metric.new(name: '', type: '', value: '')

# Solution

class Metric
  attr_accessor :name, :type, :value

  # def initialize(name, type, value)
  #     @name, @type, @value = name, type, value
  # end
end
# Metric.new(name: 'metric1', type: 'boolean', value: 1)

class MetricBuilder
  # attr_accessor :metric
  def self.build(&blk)
      builder = new
      blk.call(builder)
      builder.metric
  end

  def initialize
      @metric = Metric.new
  end

  def set_name(value)
      @metric.name = value
  end

  def set_type(value)
      @metric.type = value
  end

  def set_value(value)
      @metric.value = value
  end

  def metric
      @metric
  end
end

res = MetricBuilder.build do |builder|
  builder.set_name('metric1')
  builder.set_type('boolean')
  builder.set_value(1)
end

puts res.inspect

## Singleton

class Singleton
  @instance = new

  private_class_method :new
  def self.instance
    @instance
  end

  def xyz
    p "Hello Singleton"
  end
end

a = Singleton.instance
b = Singleton.instance
# c = Singleton.new
p a.object_id
p b.object_id
# p c.object_id