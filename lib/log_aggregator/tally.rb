module LogAggregator
  class Tally
    def initialize(ingester)
      @paths_with_connection_source = ingester.to_a
    end

    # We could leverage Array#tally here, however we'll do it the hard way for
    # backwards compatability
    def to_hash
      @paths_with_connection_source.each_with_object({}) do |path_and_ip, hash|
        hash[path_and_ip.first] ||= 0
        hash[path_and_ip.first] += 1
      end
    end
  end
end
