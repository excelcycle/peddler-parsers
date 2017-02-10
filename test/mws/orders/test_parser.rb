require "test_helper"

class TestOrdersParser < MiniTest::Test
  include MWS::Orders

  def test_overrides_peddlers_parser
    assert_equal Parser, Client.parser
  end
end
