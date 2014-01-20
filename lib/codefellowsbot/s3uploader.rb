require_relative "log_it"
require 's3'

module CodeFellowsBot
  class S3Uploader
    include LogIt

    # for testing the clockwork "cron"
    def holla
      puts "Holla!"
    end

    def upload_log
      upload_file(local_log_file_name)
    end

  private
    def establish_connection
      @s3service = S3::Service.new(
        :access_key_id => ENV['CF_AWS_KEY'],
        :secret_access_key => ENV['CF_AWS_SECRET']
      )
    end

    def upload_file(filename)
      establish_connection
      cf_bucket = @s3service.buckets.find('assets.codefellows.org')
      new_logfile = cf_bucket.objects.build( remote_chat_log_file_name )
      new_logfile.content = File.read(filename)
      new_logfile.content_type = "text/html"
      new_logfile.save
      puts "stored S3 object: #{filename}"
    end
  end
end
