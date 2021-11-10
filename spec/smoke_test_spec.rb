describe "Smoke Test" do
  subject { `#{command} 2>&1` }
  let(:command) { "./exe/log_aggregator spec/fixtures/webserver.log" }

  after do |example|
    # If these tests fail, we would like to know why
    warn subject if example.exception
  end

  context "with no filename" do
    let(:command) { "./exe/log_aggregator" }
    it "provides useful debugging information" do
      subject
      expect($?.exitstatus).to eq 1
      expect(subject).to include "No valid filename provided"
    end
  end

  context "with a invalid file" do
    let(:command) { "./exe/log_aggregator does_not_exist.log" }
    it "provides useful debugging information" do
      subject
      expect($?.exitstatus).to eq 1
      expect(subject).to include "No valid filename provided"
    end
  end

  context "with a valid filename" do
    it "accepts the log file" do
      subject
      expect($?.exitstatus).to eq 0
      expect(subject.lines.count).to be > 5
      expect(subject).to include "/about/2 90 views"
    end
  end

  context "with a --unique flag" do
    let(:command) { "./exe/log_aggregator --unique spec/fixtures/webserver.log" }

    it "accepts the log file" do
      subject
      expect($?.exitstatus).to eq 0
      expect(subject.lines.count).to be > 3
      expect(subject).to include "/about/2 22 views"
    end
  end
end
