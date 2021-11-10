describe LogAggregator::TallyPresenter do
  describe "#to_a" do
    subject { described_class.new(input).to_a }
    let(:input) { {} }

    it "presents a single line for each web page given" do
      expect(subject).to be_an Array
    end

  end
end
