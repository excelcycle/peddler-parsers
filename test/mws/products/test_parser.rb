require "test_helper"

class TestProductsParser < MiniTest::Test
  include MWS::Products

  def test_overrides_peddlers_parser
    assert_equal Parser, Client.parser
  end
end
