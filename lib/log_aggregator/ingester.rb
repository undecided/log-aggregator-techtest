module LogAggregator
  class Ingester
    def initialize(filename)
      @file = File.read(filename)
    end

    def to_a
      @file.lines
           .map { |line| line.strip.split(/\s+/) }
    end
  end
end
