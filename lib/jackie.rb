require "base64"
require "active_resource"
require "jackie/base"
require "jackie/app"
require "jackie/version"

module Jackie
  def self.api_key=(api_key)
    Jackie::Base.api_key = api_key
  end
end
