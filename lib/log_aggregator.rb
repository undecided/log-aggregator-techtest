#!/usr/bin/env ruby

Dir[File.join(File.dirname(__FILE__), "log_aggregator", "*.rb")].each do |source|
  require_relative source
end

module LogAggregator
  def self.print_processed_file(filename)
    puts *process(filename)
  end

  def self.process(filename)
    ingester = Ingester.new(filename)
    TallyPresenter.new(Tally.new(ingester)).to_a
  end
end
