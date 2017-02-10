require "nokogiri"
require "mws/products/products"
# require "mws/orders/order_items"
require "mws/products/service_status"
require "mws/products/get_lowest_offer_listings"

module MWS
  module Products
    class Parser
      SERVICE_STATUS          = /GetServiceStatus/
      PRODUCTS                = /ListMatchingProducts/
      PRODUCT                 = /GetMatchingProduct/
      GETLOWESTOFFERLISTINGS  = /GetLowestOfferListings(ForSKU|ForASIN)/
      # ORDERS         = /ListOrders/
      # ORDER_ITEMS    = /ListOrderItems/

      def initialize(response, _)
        @response = response
      end

      def parse
        xml = Nokogiri(@response.body)
        node = xml.children.find { |node| node.name.include?("Response") }

        case node.name
        when SERVICE_STATUS
          ServiceStatus.new(node)
        when PRODUCTS
          Products.new(node)
        when PRODUCT
          Product.new(node)
        when GETLOWESTOFFERLISTINGS
          GetLowestOfferListings.new(node)
        else
          raise NotImplementedError
        end
      end

      private

      def find_result_node
        xml = Nokogiri(@response.body)
        root = xml.children.first

        root.children.find { |node| node.name.include?("Result") }
      end
    end

    # Override Peddler's default Parser.
    Client.parser = Parser
  end
end
