require_relative 'log_it'

module CodeFellowsBot
  class Logger
    include Cinch::Plugin
    include LogIt

    match(/.*/, use_prefix: false)

    def execute(m)
      log_it m.user, m.message
    end

  end
end
