#!/usr/bin/env ruby

require_relative "./log_aggregator/version"

class LogAggregator
  class Error < StandardError; end

  def initialize(filename)
    @file_lines = File.read(filename).lines
  end

  def display_by_frequency!
    puts @file_lines
  end
end
