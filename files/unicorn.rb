application = 'gems'
environment = ENV['RACK_ENV'] || 'production'

preload_app true

if environment == "development"
  worker_processes 1
else
  worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
end

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
end
