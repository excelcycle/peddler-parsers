require "test_helper"

class TestProductsGetLowestOfferListing < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_asin").xpath("//xmlns:GetLowestOfferListingsForASINResult").first
    @get_lowest_offer_listing = GetLowestOfferListing.new(node)
  end

  def test_asin
    assert_equal "B002KT3XQM", @get_lowest_offer_listing.asin
  end
  def test_all_offer_listings_considered
    assert @get_lowest_offer_listing.all_offer_listings_considered
  end

  def test_has_product
    refute_nil @get_lowest_offer_listing.product
  end
end
