require_relative 'log_it'
require 'cinch'

module CodeFellowsBot
  class TopicSetter
    include Cinch::Plugin
    include LogIt

    match(/update_log/)

    def execute(m)
      m.reply "Log URL updated #{remote_chat_log_file_name}"
      m.reply "/topic Welcome to Code Fellows!!! http://www.codefellows.org | Daily \"live\" logs of the chat can be found at: http://assets.codefellows.org/logs/#{remote_chat_log_file_name} (updated every 5 minutes) | LinkedIn group: http://www.linkedin.com/groups?gid=4894383"
    end

  end
end
