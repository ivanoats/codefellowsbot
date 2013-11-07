require 'logit'

class CodeFellowsBot::Logger
  include Cinch::Plugin
  include CodeFellowsBot::LogIt

  match(/.*/, use_prefix: false)

  def execute(m)
    log_it m.user, m.message
  end

end
