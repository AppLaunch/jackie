require "test_helper"
class VersionTest < MiniTest::Unit::TestCase
  mock_requests!

  def setup
    @version = Jackie::Version.find(1)
  end

  def test_preview_url
    assert_match @version.app_id, @version.preview_url
    assert_match @version.id, @version.preview_url
  end

  def test_save_new_with_file
    version = Jackie::Version.new(app_id: 1, file: File.basename(__FILE__))
    version.save
    assert_match /http:\/\/localhost:10453\/nuvado-test\/version_test\.rb/, version.bundle_url
  end

  def test_create_with_file
    version = Jackie::Version.create(app_id: 1, file: File.basename(__FILE__))
    assert_match /http:\/\/localhost:10453\/nuvado-test\/version_test\.rb/, version.bundle_url
  end

  def test_save_new_with_bundle_url
    version = Jackie::Version.new(app_id: 1, bundle_url: "http://somewhere.in/the/cloud")
    version.save
    assert_equal "http://somewhere.in/the/cloud", version.bundle_url
  end

  def test_create_with_bundle_url
    version = Jackie::Version.create(app_id: 1, bundle_url: "http://somewhere.in/the/cloud")
    assert_equal "http://somewhere.in/the/cloud", version.bundle_url
  end
end
