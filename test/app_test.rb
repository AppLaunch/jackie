require "test_helper"
class AppTest < MiniTest::Unit::TestCase
  mock_requests!

  def setup
    @app = Jackie::App.find(1)
  end

  def test_last_preview_url
    assert_match @app.public_key, @app.last_preview_url
  end

  def test_versions
    assert_kind_of Jackie::Version, @app.versions.first
  end
end
