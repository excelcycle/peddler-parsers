require "test_helper"

class TestProductsLowestOfferListing < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_sku").xpath("//xmlns:LowestOfferListing").first
    @lowest_offer_listing = LowestOfferListing.new(node)
  end

  def test_has_qualifiers
    refute_nil @lowest_offer_listing.qualifiers
  end

  def test_number_of_offer_listings_considered
    assert_kind_of Integer, @lowest_offer_listing.number_of_offer_listings_considered
  end

  def test_seller_feedback_count
    assert_kind_of Integer, @lowest_offer_listing.seller_feedback_count
  end

  def test_has_price
    refute_nil @lowest_offer_listing.price
  end

  def test_multiple_offers_at_lowest_price
    assert @lowest_offer_listing.multiple_offers_at_lowest_price
  end
end
