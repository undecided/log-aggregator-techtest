#!/usr/bin/env ruby

Dir[File.join(File.dirname(__FILE__), "log_aggregator", "*.rb")].each do |source|
  require_relative source
end

module LogAggregator
  def self.print_simplified_aggregation(filename)
    puts *simplified_aggregation(filename)
  end

  def self.print_naive_aggregation(filename)
    puts *naive_aggregation(filename)
  end

  def self.simplified_aggregation(filename)
    ingester = Ingester.new(filename)
    TallyPresenter.new(Tally.new(ingester)).to_a
  end

  def self.naive_aggregation(filename)
    ingester = Ingester.new(filename)
    TallyPresenter.new(Tally.new(ingester, tally_operation: Tally.unique_operation)).to_a
  end
end
