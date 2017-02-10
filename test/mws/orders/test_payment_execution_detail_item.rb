require "test_helper"

class TestOrdersPaymentExecutionDetailItem < MiniTest::Test
  include MWS::Orders

  def setup
    node = load_xml_fixture("orders").xpath("//xmlns:PaymentExecutionDetailItem").first
    @pedi = PaymentExecutionDetailItem.new(node)
  end

  def test_payment
    assert_kind_of Money, @pedi.payment
  end

  def test_payment_method
    assert_kind_of String, @pedi.payment_method
  end
end
