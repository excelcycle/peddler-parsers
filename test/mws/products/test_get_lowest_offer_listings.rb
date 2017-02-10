require "test_helper"

class TestProductsGetLowestOfferListings < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("multiple_lowest_offer_listings").at_xpath("//xmlns:GetLowestOfferListingsForSKUResponse")
    @get_lowest_offer_listings = GetLowestOfferListings.new(node)
  end

  def test_has_get_lowest_offer_listings
    refute_empty @get_lowest_offer_listings.to_a
    assert_equal 3, @get_lowest_offer_listings.count
    @get_lowest_offer_listings.each do |get_lowest_offer_listing|
      assert_kind_of GetLowestOfferListing, get_lowest_offer_listing
    end
  end

  # def test_all_offer_listings_considered
  #   refute @lowest_offer_listing.all_offer_listings_considered
  # end

end
