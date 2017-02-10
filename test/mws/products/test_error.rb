require "test_helper"

class TestProductsError < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_asin_error").xpath("//xmlns:Error").first
    @error = Error.new(node)
  end

  def test_code
    assert_kind_of String, @error.code
  end

  def test_type
    assert_kind_of String, @error.type
  end

  def test_message
    assert_kind_of String, @error.message
  end
end
