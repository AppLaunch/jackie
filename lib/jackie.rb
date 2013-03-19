require "base64"
require "active_resource"
require "jackie/base"
require "jackie/app"
require "jackie/version"
require "jackie/aws_uploader"

module Jackie
  def self.api_key=(api_key)
    Jackie::Base.api_key = api_key
  end

  # So, it should be straightforward to add support for ftp or dropbox or whatever.
  # By creating a uploader (with the public api of AWSUploader) and calling set_uploader with it
  def self.configure_s3(connection_params, access_params)
    Jackie::Version.set_uploader(Jackie::AWSUploader.new(connection_params, access_params))
  end
end
