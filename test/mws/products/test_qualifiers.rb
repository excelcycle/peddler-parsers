require "test_helper"

class TestProductsQualifiers < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_sku").xpath("//xmlns:Qualifiers").first
    @qualifiers = Qualifiers.new(node)
  end

  def test_item_condition
    assert_kind_of String, @qualifiers.item_condition
  end

  def test_item_subcondition
    assert_kind_of String, @qualifiers.item_subcondition
  end

  def test_fulfillment_channel
    assert_kind_of String, @qualifiers.fulfillment_channel
  end

  def test_ships_domestically
    assert_kind_of String, @qualifiers.ships_domestically
  end

  def test_shipping_time
    assert_kind_of String, @qualifiers.shipping_time
  end

  def test_seller_positive_feedback_rating
    assert_kind_of String, @qualifiers.seller_positive_feedback_rating
  end
end
