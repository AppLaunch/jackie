require "base64"
require "active_resource"
require "aws/s3"
require "jackie/base"
require "jackie/app"
require "jackie/version"

module Jackie
  def self.api_key=(api_key)
    Jackie::Base.api_key = api_key
  end
  def self.configure_s3(connection_params, access_params)
    Jackie::Version.configure_s3(connection_params, access_params)
  end
end
