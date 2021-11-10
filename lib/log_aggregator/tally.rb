module LogAggregator
  # We could leverage Array#tally here, however we'll do it the hard way for
  # backwards compatability
  class Tally
    def initialize(ingester)
      @paths_with_connection_source = ingester.to_a
    end

    def to_hash
      @paths_with_connection_source.each_with_object({}) do |(path, ip), hash|
        hash[path] ||= 0
        hash[path] += 1
      end
    end

    def to_unique_hash
      @paths_with_connection_source.each_with_object({}) do |(path, ip), hash|
        hash[path] ||= []
        hash[path] |= [ip] # set union, not or-equals
      end.transform_values { |v| v.count }
    end
  end
end
