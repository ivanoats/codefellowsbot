require_relative 'log_it'

module CodeFellowsBot
  class Helper
    include Cinch::Plugin
    include LogIt

    match(/^help/i, use_prefix: false)

    def execute(m)
      message = [
        "Have you written a test for that?",
        "Have you tried turning the computer off and on again?",
        "Try this: 'sudo !!'",
        "Hello. I am a duck. How would you describe the issue?",
        "Did a recent change cause this behavior?",
        "You did restart the server, right?",
        "What is actual error message?",
        "See if any of these steps can help you: http://hijk.it/3d3m0M0f2z0f",
        "Maybe post a longer description to stack overflow",
        "Drop and give me 20!",
        "I need somebody",
        "Not just anybody",
        "You know I need someone",
        "Check this out: http://blogs.akamai.com/2013/10/you-must-try-and-then-you-must-ask.html"
      ].sample
      m.reply message
      log_it "bot", message
    end
  end
end
