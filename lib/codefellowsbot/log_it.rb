module CodeFellowsBot
  module LogIt
    def log_file_name
      "./codefellows_chat_log-#{Date.today}.html"
    end

    def log_it(user, message)
      File.open(log_file_name,"a") do |file|
        file.puts "<small>(#{Time.now.asctime})</small> <b>#{user}</b>: #{message}"
      end
    end
  end
end
