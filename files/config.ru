require 'rubygems'
require 'geminabox'

Geminabox.data = '/opt/geminabox/data'
Geminabox.build_legacy = ENV['BUILD_LEGACY'] && ENV['BUILD_LEGACY'].downcase.strip == 'true'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == [ENV['USERNAME'], ENV['PASSWORD']]
end

run Geminabox::Server
