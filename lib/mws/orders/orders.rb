require "mws/core/collection"
require "mws/orders/order"
require "mws/core/tokenable"

module MWS
  module Orders
    class Orders < Core::Collection
      include Core::Tokenable

      def each(&blk)
        xpath("Orders/Order").map { |node| yield Order.new(node) }
      end
    end
  end
end
