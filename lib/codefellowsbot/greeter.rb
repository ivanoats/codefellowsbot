module CodeFellowsBot
  class Greeter
    include Cinch::Plugin
    include LogIt

    match(/^hello/, use_prefix: false)

    def execute(m)
      message = "Hello, #{m.user.nick}"
      m.reply message
      log_it "bot", message
    end
  end
end
