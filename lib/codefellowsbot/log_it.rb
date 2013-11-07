module CodeFellowsBot
  module LogIt
    def log_it(user, message)
      File.open("./codefellows_chat_log.txt","a") do |file|
        file.puts "#{user}: #{message}"
      end
    end
  end
end
