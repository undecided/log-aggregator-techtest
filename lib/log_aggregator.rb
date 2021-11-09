#!/usr/bin/env ruby

require_relative "./log_aggregator/version"

class LogAggregator
  class Error < StandardError; end

  def initialize(filename)
    @file_lines = File.read(filename)
                      .lines
                      .map { |line| line.strip.split(/\s+/) }
  end

  def display_by_frequency!
    # We could use Array#tally here, however we'll do it the hard way for
    # backwards compatability
    @file_lines.each_with_object({}) do |path_and_ip_arr, hash|
      hash[path_and_ip_arr.first] ||= 0
      hash[path_and_ip_arr.first] += 1
    end.map { |path_and_tally| path_and_tally.join(" ")}
  end
end
