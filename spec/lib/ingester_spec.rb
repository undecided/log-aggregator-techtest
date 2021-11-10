describe LogAggregator::Ingester do
  describe "#to_a" do
    subject { described_class.new(log_filename).to_a }
    let(:log_filename) { "./spec/fixtures/simplified_happy_path.log" }

    it "returns an array of tokenized lines" do
      expect(subject).to be_an Array
    end

  end
end
