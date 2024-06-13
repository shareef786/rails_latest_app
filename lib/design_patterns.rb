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

MetricBuilder.build do |builder|
  builder.set_name('name')
  builder.set_type('name')
  builder.set_vale('name')
end

class MetricBuilder
  def self.build
    builder = new
    yield(builder)
  end
end

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