require "test_helper"

class TestOrdersPaymentExecutionDetail < MiniTest::Test
  include MWS::Orders

  def setup
    node = load_xml_fixture("orders").xpath("//xmlns:PaymentExecutionDetail").first
    @ped = PaymentExecutionDetail.new(node)
  end

  def test_has_payment_execution_detail_items
    refute_empty @ped.to_a
    @ped.each do |pedi|
      assert_kind_of PaymentExecutionDetailItem, pedi
    end
  end
end
