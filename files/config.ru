require 'rubygems'
require 'geminabox'

Geminabox.data = '/opt/geminabox/data'
Geminabox.build_legacy = ENV['BUILD_LEGACY'] && ENV['BUILD_LEGACY'].downcase.strip == 'true'
run Geminabox::Server
