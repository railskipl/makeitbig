require 'rubygems'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new
scheduler.every("60s") do
    SubscribersController.do_something
end
