require "test_helper"

class TestProductsSellerSKUIdentifier < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_sku").at_xpath("//xmlns:SKUIdentifier")
    @seller_sku_identifier = SellerSKUIdentifier.new(node)
  end

  def test_marketplace_id
    assert_kind_of String, @seller_sku_identifier.marketplace_id
  end

  def test_seller_id
    assert_kind_of String, @seller_sku_identifier.seller_id
  end

  def test_seller_sku
    assert_kind_of String, @seller_sku_identifier.seller_sku
  end
end
