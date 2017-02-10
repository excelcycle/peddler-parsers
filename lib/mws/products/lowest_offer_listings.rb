require "mws/core/collection"
require "mws/products/lowest_offer_listing"

module MWS
  module Products
    class LowestOfferListings < Core::Collection

      def each(&blk)
        xpath("LowestOfferListing").map { |node| yield LowestOfferListing.new(node) }
      end
    end
  end
end
