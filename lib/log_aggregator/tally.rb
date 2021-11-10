module LogAggregator
  # We could leverage Array#tally here, however we'll do it the hard way for
  # backwards compatability
  class Tally
    def self.default_operation
      -> (array, ip) { array.push(ip) }
    end

    def self.unique_operation
      -> (array, ip) { array | [ip] }
    end

    def initialize(ingester, tally_operation: self.class.default_operation)
      @paths_with_connection_source = ingester.to_a
      @tally_operation = tally_operation
    end

    def to_hash
      @paths_with_connection_source.each_with_object({}) do |(path, ip), hash|
        hash[path] ||= []
        hash[path] = @tally_operation.call(hash[path], ip)
      end.transform_values { |v| v.count }
    end
  end
end
