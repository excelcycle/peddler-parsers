require "test_helper"

class TestProductsMarketplaceASIN < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_sku").at_xpath("//xmlns:MarketplaceASIN")
    @marketplace_asin = MarketplaceASIN.new(node)
  end

  def test_marketplace_id
    assert_kind_of String, @marketplace_asin.marketplace_id
  end

  def test_asin
    assert_kind_of String, @marketplace_asin.asin
  end
end
