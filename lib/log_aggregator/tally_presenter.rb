module LogAggregator
  class TallyPresenter
    def initialize(tally)
      @tally = tally.to_hash
    end

    def to_a
      @tally.map { |path_and_tally| path_and_tally.join(" ")}
    end
  end
end
