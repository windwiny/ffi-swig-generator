require 'rubygems'

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '../lib/')))

require 'ffi-swig-generator'

RSpec::configure do |config|
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
end

def generate_xml_wrap_from(fn)
  pwd = File.expand_path '..', __FILE__
  f_inp = "#{pwd}/generator/swig/#{fn}.i"
  f_xml = "#{pwd}/generator/swig/#{fn}_wrap.xml"
  if !File.exist?(f_xml) || File.mtime(f_xml) < File.mtime(f_inp)
    `swig -xml #{f_inp}`
  end
  Nokogiri::XML(File.open(f_xml))
end

def remove_xml
  FileUtils.rm(Dir.glob(File.expand_path '../generator/swig/*.xml', __FILE__))
end

share_examples_for "All specs" do
  after :all do
    remove_xml
  end
end

# EOF
