## Simple Responsibility

class Metric
  def initialize(name, metadata)
    @name, @metadata = name, metadata
  end

  def generate_report
    # code to generate report
    send_email # problem is here
  end

  def send_email
    send_mail(name)
  end
end

# Solution

class ReportGenerator
  def initialize(name)
    @name = name
  end

  def generate
    # code to generate
  end
end

class ReportMailer
  def initialize(name)
    @name = name
  end

  def send_email
    send_mail(name)
  end
end

## Open/CLose Principle

# Problem
class ReportGenerator
  def initialize(name, metadata)
    @name, @metadata = name, metadata
  end

  def generate_report
    if name == 'boolean_metric'
      # generate report for Bollean Metric
    else
      # generate report for other all remaining metrics
    end
  end
end

# Solution

class BooleanMetricGenerator
  def initialize(name, metadata)
    @name, @metadata = name, metadata
  end

  def generate_report
    # generate report for boolean metric
  end
end

class CategoryMetricGenerator
  def initialize(name, metadata)
    @name, @metadata = name, metadata
  end

  def generate_report
    # generate report for Category Metric
  end
end

GENERATORS = {
  'boolean' => BooleanMetricGenerator, 
  'category' => CategoryMetricGenerator
}

class ReportGenerator
  def initialize(name, metadata)
    @name, @metadata = name, metadata
  end

  def generate
    GENERATORS[name].new(name, metadata).generate_report
  end
end

## Liskov Substitution Principle

# use abstraction method

class Metric
  def generate_report
    raise 'NotImplemented'
  end
end

class BooleanMetric < Metric
  def generate_report
  end
end

class BooleanMetric < Metric
  def generate_report
  end
end

class DayBucketedMetri < Metric
  def initialize(name, metadata)
    @name, @metadata = name, metadata
  end
end

puts DayBucketedMetri.new('a',{a: 1}).generate_report





### Interface Segregation Principle

# Problem
module MetricActions
  def create
  end

  def update
  end

  def destroy
  end
end

class CreateMetric
  include MetricActions
end

class UpdateMetric
  include MetricActions
end

CreateMetric.new.create
UpdateMetric.new.update
# But here update method is avaialble for CreateMetric class though it is not relevant

# Solution

module CreateAction
  def create
  end
end

module UpdateAction
  def update
  end
end

class CreateMetric
  include CreateAction
end

class UpdateMetric
include UpdateAction
end




### Dependency Injection
class BooleanMetricLogger
  def message
    puts "Log the boolean metric data"
  end
end

class MetricLogger
  attr_reader :logger

  def initialize(logger)
    @logger = logger
  end

  def print_data
    puts logger.message
  end
end

logger = BooleanMetricLogger.new
logger = CategoryMetricLogger.new
metric = MetricLogger.new(logger)
metric.print_data

