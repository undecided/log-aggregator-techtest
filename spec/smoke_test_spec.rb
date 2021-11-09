describe "Smoke Test" do
  it "accepts the log file" do
    output = `./bin/log_aggregator spec/fixtures/webserver.log`
    expect($?.exitstatus).to eq 0
    puts output
    expect(output.lines.count).to be > 5
  end
end
