require "test_helper"

class TestProductsProducts < MiniTest::Test
  include MWS::Products

  def setup
    node = load_xml_fixture("get_lowest_offer_listings_sku").xpath("//xmlns:Product")
    @products = Products.new(node)
  end

  def test_has_products
    refute_empty @products.to_a
    assert_equal 3, @products.count
    @products.each do |product|
      assert_kind_of Product, product
    end
  end
end
