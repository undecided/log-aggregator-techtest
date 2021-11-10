module LogAggregator
  class TallyPresenter
    def initialize(tally, noun: "views")
      @tally = tally.to_hash
      @noun = noun
    end

    def to_a
      @tally
        .sort_by { |line| line.last }
        .reverse
        .map { |(path, tally)| "#{path} #{tally} #{@noun}" }
    end
  end
end
