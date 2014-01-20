module CodeFellowsBot
  module LogIt
    def local_log_file_name
      "./logs/codefellows_chat_log-#{Date.today}.html"
    end

    def remote_chat_log_file_name
      "chat-log-#{Date.today}.html"
    end

    def log_it(user, message)
      File.open(local_log_file_name,"a") do |file|
        file.puts "<p><small>(#{Time.now.asctime})</small> <b>#{user}</b>: #{message}</p>"
      end
    end
  end
end
