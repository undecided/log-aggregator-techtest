describe LogAggregator do
  describe "#process" do
    subject { described_class.process(log_filename) }
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
