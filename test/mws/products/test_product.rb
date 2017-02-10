require "test_helper"

class TestProductsProduct < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_sku").at_xpath("//xmlns:Product")
    @product = Product.new(node)
  end

  def test_has_identifiers
    refute_nil @product.identifiers
  end

  def test_has_lowest_offer_listings
    refute_nil @product.lowest_offer_listings
  end
end
