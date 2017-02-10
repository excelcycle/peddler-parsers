require "mws/core/entity"

module MWS
  module Products
    class Price < Core::Entity
      attribute(:landed_price) do
        money_at_xpath("LandedPrice")
      end

      attribute(:listing_price) do
        money_at_xpath("ListingPrice")
      end

      attribute(:shipping) do
        money_at_xpath("Shipping")
      end
    end
  end
end
