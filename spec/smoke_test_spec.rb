describe "Smoke Test" do
  it "accepts the log file" do
    output = `./bin/log_aggregator spec/fixtures/webserver.log`
    expect($?.exitstatus).to eq 0
    expect(output.lines.count).to be > 100
  end

end
