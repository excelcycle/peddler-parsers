require "mws/core/collection"
require "mws/products/get_lowest_offer_listing"

module MWS
  module Products
    class GetLowestOfferListings < Core::Collection

      def each(&blk)
        xpath("GetLowestOfferListingsForSKUResult|GetLowestOfferListingsForASINResult").map { |node| yield GetLowestOfferListing.new(node) }
      end
    end
  end
end
