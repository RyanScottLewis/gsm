require 'gsm'
require 'mocha/api'
require 'pathname'
require 'pp'

Pathname.glob( Pathname.new(__FILE__).join('../support/**/*.rb') ).each { |f| require(f) }

require 'fakefs'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = 'random'
end
