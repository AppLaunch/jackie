module Jackie
  class Version < Base
    cattr_accessor :s3_config, :instance_writer => false
    before_create :upload_to_s3, :if => Proc.new{ attributes["file"] &&  s3_config }

    class << self

      # connection_params
      # => access_key_id
      # => secret_access_key
      # access params
      # => bucket
      def configure_s3(connection_params, access_params)
        AWS::S3::Base.establish_connection!(connection_params)
        self.s3_config = access_params
      end
    end

    def preview_url
      "http://kickfolio.com/v/#{app_id}/version/#{id}"
    end

    private
    def upload_to_s3
      AWS::S3::S3Object.store(file, open(file), s3_config[:bucket])
      self.bundle_url = AWS::S3::S3Object.url_for(file, s3_config[:bucket])
    end
  end
end