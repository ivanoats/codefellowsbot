require 'test_helper'

describe CodeFellowsBot::Bot do
  it 'should make a bot' do
    bot = CodeFellowsBot::Bot.new
    bot.bot.must_be_instance_of Cinch::Bot
  end
end
