module CodeFellowsBot
  module LogIt
    def log_it(user, message)
      File.open("./codefellows_chat_log.txt","a") do |file|
        file.puts "#{user}: #{message}"
      end
      if (Time.now.min % 5 == 0)
        S3Uploader.upload_log
      end
    end
  end
end
