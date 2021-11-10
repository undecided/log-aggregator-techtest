describe LogAggregator::TallyPresenter do
  describe "#to_a" do
    subject { described_class.new(input).to_a }
    let(:input) { {} }

    it "presents a single line for each web page given" do
      expect(subject).to be_an Array
    end

    context "given randomly ordered input" do
      let(:input) { {"foo" => 1, "bar" => 3, "baz" => 2} }

      it "orders the output by highest number" do
        expect(subject).to eq [
          "bar 3",
          "baz 2",
          "foo 1",
        ]
      end
    end

  end
end
