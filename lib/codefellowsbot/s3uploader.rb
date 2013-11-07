module CodeFellowsBot
  class S3Uploader
    require 's3'

    # for testing the clockwork "cron"
    def self.holla
      puts "Holla!"
    end

    def self.upload_log
      upload_file('./codefellows_chat_log.txt')
    end

  private
    def self.establish_connection
      @s3service = S3::Service.new(
        :access_key_id => ENV['CF_AWS_KEY'],
        :secret_access_key => ENV['CF_AWS_SECRET']
      )
    end

    def self.upload_file(filename)
      establish_connection
      cf_bucket = @s3service.buckets.find('assets.codefellows.org')
      new_logfile = cf_bucket.objects.build(
        "chat-log-#{Time.now.strftime("%Y%m%d")}.txt"
      )
      new_logfile.content = File.read(filename)
      new_logfile.save
      puts "stored S3 object: #{filename}"
    end
  end
end
