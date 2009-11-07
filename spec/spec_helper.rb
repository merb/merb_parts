require 'rubygems'

# Use current merb-core sources if running from a typical dev checkout.
lib = File.expand_path('../../../merb/merb-core/lib', __FILE__)
$LOAD_PATH.unshift(lib) if File.directory?(lib)
require "merb-core"

# The lib under test
require 'merb_parts'

# Require the fixtures
Dir[File.join(File.dirname(__FILE__), "fixtures", "*/**.rb")].each{|f| require f }

Merb.start(
  :environment => 'test',
  :adapter => 'runner',
  :log_level => :error,
  :disabled_components => [:json]
)

Spec::Runner.configure do |config|
  config.include Merb::Test::RequestHelper  
end
