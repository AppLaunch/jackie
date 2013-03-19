module Jackie
  class AWSUploader
    def initialize(connection_params, access_params)
      load_dependency
      AWS::S3::Base.establish_connection!(connection_params)
      @config = access_params
    end

    def upload(file)
      AWS::S3::S3Object.store(file, open(file), @config[:bucket])
      AWS::S3::S3Object.url_for(file, @config[:bucket])
    end

    private
    def load_dependency
      begin
        require "aws/s3"
      rescue LoadError => e
        $stderr.puts "You don't have aws/s3 installed in your application. Please add it to your Gemfile and run bundle install"
        raise e
      end
    end
  end
end