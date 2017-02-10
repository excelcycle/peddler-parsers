require "mws/core/entity"
require "mws/products/identifiers"
require "mws/products/lowest_offer_listings"

module MWS
  module Products
    class Product < Core::Entity
      attribute(:identifiers) do
        if node = xpath("Identifiers").first
          Identifiers.new(node)
        end
      end

      attribute(:lowest_offer_listings) do
        if node = xpath("LowestOfferListings").first
          LowestOfferListings.new(node)
        end
      end
    end
  end
end
