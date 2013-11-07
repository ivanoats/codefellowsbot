require 'bundler/setup'
require 'cinch'
require 'codefellowsbot/s3uploader'
require 'codefellowsbot/greeter'
require 'codefellowsbot/helper'
require 'codefellowsbot/logger'

bot = Cinch::Bot.new do
  configure do |c|
    c.server   = 'irc.freenode.org'
    c.channels = ['#codefellows']
    c.nick     = 'codefellowsbot'
    c.user     = 'codefellowsbot'
    c.verbose  = true
    c.plugins.plugins  = [
      CodeFellowsBot::Logger,
      CodeFellowsBot::Greeter,
      CodeFellowsBot::Helper,
    ]
  end
end

bot.loggers << Cinch::Logger::FormattedLogger.new(File.open("./codefellows_chat_log_from_cinch.txt","a"))
bot.loggers.level = :debug
bot.start
