describe LogAggregator::Tally do
  describe "#to_hash" do
    subject { described_class.new(input).to_hash }
    let(:input) { [] }

    it "produces a hash mapping paths to their frequency" do
      expect(subject).to be_an Hash
    end
  end
end
