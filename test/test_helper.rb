testdir = File.dirname(__FILE__)
$LOAD_PATH.unshift testdir unless $LOAD_PATH.include?(testdir)

libdir = File.dirname(File.dirname(__FILE__)) + '/lib'
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include?(libdir)

require "rubygems"
require "jackie"
require "minitest/unit"
require "minitest/autorun"

Jackie.api_key =  "MyKickfolioApiKey"

class MiniTest::Unit::TestCase
  def with_fake_s3
    Jackie.configure_s3({
      :access_key_id => "123",
      :secret_access_key => "abc",
      :server => "localhost",
      :port => "10453"
    }, {:bucket => "nuvado-test"})

    yield
  ensure
    AWS::S3::Base.disconnect!
    Jackie::Version.uploader = nil
  end

  def self.mock_requests!
    # FIXME move to fixture module
    @app = { "id" => "1",
             "user_id"=>"1",
             "name"=>"firebaseco",
             "public_key"=>"zOBZ6A",
             "bundle"=>"firebaeco",
             "icon"=>nil,
             "default_to_landscape"=>false,
             "device_type"=>"iPad",
             "created_at"=>"2013-02-21T20:16:23Z",
             "updated_at"=>"2013-02-21T20:16:28Z",
             "version_ids"=>["81965734-28b3-45e3-b8ca-837823e4e18c"]
    }.to_json

    @version = {"id"=>"1",
                "app_id"=>"1",
                "state"=>"ready",
                "bundle_url"=>"https://dl.dropbox.com/s/1",
                "encrypted_bundle_url"=>"3qI/PmSqZdT1v6sgYJNzhw==",
                "version_string"=>"1.0",
                "default_image"=>nil,
                "default_image_landscape"=>nil,
                "has_job_id"=>false,
                "created_at"=>"2013-02-21T20:16:24Z",
                "updated_at"=>"2013-02-21T20:16:28Z",
                "comment_ids"=>[]}

    @headers = {"Accept"=>"application/vnd.kickfolio.v1", "Authorization"=>"Basic TXlLaWNrZm9saW9BcGlLZXk="}
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/apps/1.json", @headers, @app
      mock.get "/api/versions.json?app_id=1", @headers, [@version].to_json
      mock.get "/api/versions/1.json", @headers, @version.to_json
      mock.post "/api/versions.json", @headers
    end
  end
end
