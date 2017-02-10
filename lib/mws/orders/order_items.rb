require "mws/core/collection"
require "mws/orders/order_item"
require "mws/core/tokenable"

module MWS
  module Orders
    class OrderItems < Core::Collection
      include Core::Tokenable

      def each(&blk)
        xpath("OrderItems/OrderItem").each { |node| yield OrderItem.new(node) }
      end
    end
  end
end
