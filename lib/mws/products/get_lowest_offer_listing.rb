require "mws/core/entity"
require "mws/products/error"

module MWS
  module Products
    class GetLowestOfferListing < Core::Entity

      attribute(:sellersku) do
        text_attribute_value('SellerSKU')
      end

      attribute(:asin) do
        text_attribute_value('ASIN')
      end

      attribute(:all_offer_listings_considered) do
        bool_at_xpath("AllOfferListingsConsidered")
      end

      attribute(:product) do
        if node = xpath("Product").first
          Product.new(node)
        end
      end

      attribute(:error) do
        if node = xpath("Error").first
          Error.new(node)
        end
      end
    end
  end
end
