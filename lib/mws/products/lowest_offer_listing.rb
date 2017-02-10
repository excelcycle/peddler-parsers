require "mws/core/entity"
require "mws/products/qualifiers"
require "mws/products/price"

module MWS
  module Products
    class LowestOfferListing < Core::Entity
      attribute(:qualifiers) do
        if node = xpath("Qualifiers").first
          Qualifiers.new(node)
        end
      end

      attribute(:number_of_offer_listings_considered) do
        integer_at_xpath("NumberOfOfferListingsConsidered")
      end

      attribute(:seller_feedback_count) do
        integer_at_xpath("SellerFeedbackCount")
      end

      attribute(:price) do
        if node = xpath("Price").first
          Price.new(node)
        end
      end

      attribute(:multiple_offers_at_lowest_price) do
        bool_at_xpath("MultipleOffersAtLowestPrice")
      end
    end
  end
end
