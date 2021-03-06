Given /^the fixture file "(.*?)"$/ do |filename|
  @input    = fixture_file(filename)
  @filename = filename
end

Given /^I convert to "(.*?)"$/ do |conversion|
  @tmp_filename = "output_#{rand(1000)}_#{@filename}"
  @output       = tmp_file(@tmp_filename)
  input         = File.read(@input)
  kernel        = Opener::KafNafParser.new(:conversion=>conversion)
  output        = kernel.run(input)

  File.open(@output, 'w') do |handle|
    handle.write(output)
  end
end

Then /^the output should match the fixture "(.*?)"$/ do |filename|
  fixture_output = File.read(fixture_file(filename))
  output         = File.read(@output)

  output.should eql(fixture_output)
end

def fixture_file(filename)
  File.expand_path("../../../features/fixtures/#{filename}", __FILE__)
end

def tmp_file(filename)
  File.expand_path("../../../tmp/#{filename}", __FILE__)
end
