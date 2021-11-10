describe LogAggregator do
  describe "#simplified_aggregation" do
    subject { described_class.simplified_aggregation(log_filename) }
    let(:log_filename) { "./spec/fixtures/simplified_happy_path.log" }

    context "given a list of web pages with ip addresses" do
      it "presents a single line for each web page given" do
        expect(subject).to eq [
          "/about 2",
          "/help_page/1 2",
          "/index 1",
        ]
      end
    end

  end
end
