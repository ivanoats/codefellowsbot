require 'bundler/setup'
require 'clockwork'
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'codefellowsbot/s3uploader'

include Clockwork

handler do |job, time|
  puts "Running #{job} at #{time}"
end

# test it
# every(15.seconds, 'holla') { CodeFellowsBot::S3Uploader.holla }

every(5.minutes, 'uploader') { CodeFellowsBot::S3Uploader.upload_log }
