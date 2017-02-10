require "test_helper"

class TestOrdersServiceStatusMessage < MiniTest::Test
  include MWS::Orders

  def setup
    node = load_xml_fixture("service_status").xpath("//xmlns:Message").first
    @message = ServiceStatusMessage.new(node)
  end

  def test_locale
    assert_kind_of String, @message.locale
  end

  def test_text
    assert_kind_of String, @message.text
  end
end
