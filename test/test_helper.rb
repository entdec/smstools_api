$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "smstools_api"

require "minitest/autorun"
require "pry"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :faraday
end
