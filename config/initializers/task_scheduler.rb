require 'rubygems'
require 'rake'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every '12h' do
  system 'bundle exec rake cleanup:daily_cleanup --trace RAILS_ENV=production'
end
