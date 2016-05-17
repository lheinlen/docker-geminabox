require 'rubygems'
require 'geminabox'
require 'bundler'
require 'sinatra'

Bundler.require

Geminabox.data = '/opt/geminabox/data'
Geminabox.build_legacy = ENV['BUILD_LEGACY'] && ENV['BUILD_LEGACY'].downcase.strip == 'true'
Geminabox.rubygems_proxy = true

class HealthChecker < Sinatra::Base
  get '/healthcheck' do
    "OK"
  end
end

use HealthChecker
use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == ENV['USERNAME'] && password = ENV['PASSWORD']
end

run Geminabox::Server
