require 'bundler/setup'
require 'cinch'
require 'codefellowsbot/s3uploader'
require 'codefellowsbot/greeter'
require 'codefellowsbot/helper'
require 'codefellowsbot/topic_setter'
require 'codefellowsbot/logger'

module CodeFellowsBot
  class Bot
    attr_reader :bot

    def initialize
      @bot = Cinch::Bot.new do
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
            CodeFellowsBot::TopicSetter
          ]
        end
      end
    end
  end
end

