describe LogAggregator do
  describe "#display_by_frequency" do
    context "given a list of web pages with ip addresses" do
      let(:log_filename) { "./spec/fixtures/simplified_happy_path.log" }
      subject { described_class.new(log_filename).display_by_frequency! }

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
