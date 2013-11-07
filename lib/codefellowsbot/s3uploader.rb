module CodeFellowsBot
  class S3Uploader
    require 'aws/s3'

    def self.upload_log
      upload_file('./codefellows_chat_log.txt')
    end

  private
    def establish_connection
      AWS:S3::Base.establish_connection!(
        :access_key_id => ENV['CF_AWS_KEY'],
        :secret_access_key => ENV['CF_AWS_SECRET']
      )
    end

    def upload_file(filename)
      establish_connection
      S3Object.store(filename, open('filename'), 'assets.codefellows.org')
      puts "stored S3 object: #{filename}"
    end
  end
end
