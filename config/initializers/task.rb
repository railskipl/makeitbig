require 'rubygems'
require 'rufus/scheduler'  
scheduler = Rufus::Scheduler.new
scheduler.every("6d") do
    SubscribersController.do_something
end