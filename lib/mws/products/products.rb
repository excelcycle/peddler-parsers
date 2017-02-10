require "mws/core/collection"
require "mws/products/product"

module MWS
  module Products
    class Products < Core::Collection

      def each(&blk)
        xpath("Products/Product").map { |node| yield Product.new(node) }
      end
    end
  end
end
