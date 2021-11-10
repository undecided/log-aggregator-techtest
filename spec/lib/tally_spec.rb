describe LogAggregator::Tally do
  let(:input) do
    [
      ["/foo/bar", "1.1.1.1"],
      ["/foo/bar", "1.1.1.1"],
      ["/baz/1", "1.1.1.1"],
      ["/baz/1", "1.1.1.2"]
    ]
  end

  describe "#to_hash" do
    subject { described_class.new(input).to_hash }

    it "produces a hash mapping paths to their frequency" do
      expect(subject).to eq({"/baz/1"=>2, "/foo/bar"=>2})
    end
  end

  describe "#to_unique_hash" do
    subject { described_class.new(input).to_unique_hash }

    it "produces a hash mapping paths to their unique frequency" do
      expect(subject).to eq({"/baz/1"=>2, "/foo/bar"=>1})
    end
  end

end
