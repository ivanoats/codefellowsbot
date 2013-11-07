class CodeFellowsBot::Greeter
  include Cinch::Plugin
#  include CodeFellowsBot::LogIt

  match(/^hello/, use_prefix: false)

  def execute(m)
    message = "Hello, #{m.user.nick}"
    m.reply message
#    log_it "bot", message
  end
end
