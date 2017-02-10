require "test_helper"

class TestProductsPrice < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_sku").xpath("//xmlns:Price").first
    @price = Price.new(node)
  end

  def test_landed_price
    assert_kind_of Money, @price.landed_price
  end

  def test_listing_price
    assert_kind_of Money, @price.listing_price
  end

  def test_shipping
    assert_kind_of Money, @price.shipping
  end
end
