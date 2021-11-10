describe LogAggregator::TallyPresenter do
  describe "#to_a" do
    subject { described_class.new(input).to_a }
    let(:input) { {"foo" => 1, "bar" => 3, "baz" => 2} }

    it "presents a single line for each web page given" do
      expect(subject).to be_an Array
    end

    context "given randomly ordered input" do

      it "orders the output by highest number" do
        expect(subject).to eq [
          "bar 3 views",
          "baz 2 views",
          "foo 1 views",
        ]
      end
    end

    context "given an override description" do
      subject { described_class.new(input, noun: "unique views").to_a }

      it "orders the output by highest number" do
        expect(subject).to eq [
          "bar 3 unique views",
          "baz 2 unique views",
          "foo 1 unique views",
        ]
      end
    end

  end
end
