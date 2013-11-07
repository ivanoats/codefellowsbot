require 'cinch'

module LogIt
  def log_it(user, message)
    File.open("./codefellows_chat_log.txt","a") do |file|
      file.puts "#{user}: #{message}"
    end
  end
end

class CFLogger
  include Cinch::Plugin
  include LogIt

  match(/.*/, use_prefix: false)

  def execute(m)
    log_it m.user, m.message
  end

end

class CFGreeter
  include Cinch::Plugin
#  include LogIt

  match(/^hello/, use_prefix: false)

  def execute(m)
    message = "Hello, #{m.user.nick}"
    m.reply message
#    log_it "bot", message
  end
end

class CFHelper
  include Cinch::Plugin
  include LogIt

  match(/^help/i, use_prefix: false)

  def execute(m)
    message = [
      "Have you written a test for that?",
      "Have you tried turning the computer on and off again?",
      "Hello. I am a duck. How would you describe the issue?",
      "Did a recent change cause this behavior?",
      "You did restart the server, right?",
      "What is actual error message?",
      "See if any of these steps can help you: http://hijk.it/3d3m0M0f2z0f",
      "Maybe post a longer description to stack overflow",
      "Drop and give me 20!",
    ].sample
    m.reply message
    log_it "bot", message
  end
end

bot = Cinch::Bot.new do
  configure do |c|
    c.server   = 'irc.freenode.org'
    c.channels = ['#codefellows']
    c.nick     = 'codefellowsbot'
    c.user     = 'codefellowsbot'
    c.verbose  = true
    c.plugins.plugins  = [CFLogger, CFGreeter, CFHelper]
  end

end

bot.loggers << Cinch::Logger::FormattedLogger.new(File.open("./codefellows_chat_log_from_cinch.txt","a"))
bot.loggers.level = :debug
bot.start
