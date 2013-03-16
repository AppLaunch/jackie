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
end
