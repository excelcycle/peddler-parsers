require "mws/core/collection"
require "mws/orders/payment_execution_detail_item"

module MWS
  module Orders
    class PaymentExecutionDetail < Core::Collection
      def each(&blk)
        xpath("PaymentExecutionDetailItem").each { |node| yield PaymentExecutionDetailItem.new(node) }
      end
    end
  end
end
