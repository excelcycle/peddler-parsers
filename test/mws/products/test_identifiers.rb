require "test_helper"

class TestProductsIdentifiers < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_sku").at_xpath("//xmlns:Identifiers")
    @identifiers = Identifiers.new(node)
  end

  def test_has_marketplace_asin
    refute_nil @identifiers.marketplace_asin
  end

  def test_has_sku_identifier
    refute_nil @identifiers.sku_identifier
  end
end
