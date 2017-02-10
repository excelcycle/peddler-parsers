require "test_helper"

class TestProductsLowestOfferListings < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_sku").xpath("//xmlns:LowestOfferListings").first
    @lowest_offer_listings = LowestOfferListings.new(node)
  end

  def test_has_lowest_offer_listings
    refute_empty @lowest_offer_listings.to_a
    assert_equal 3, @lowest_offer_listings.count
    @lowest_offer_listings.each do |lowest_offer_listing|
      assert_kind_of LowestOfferListing, lowest_offer_listing
    end
  end
end
