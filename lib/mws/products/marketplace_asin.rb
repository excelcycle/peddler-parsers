require "mws/core/entity"

module MWS
  module Products
    class MarketplaceASIN < Core::Entity
      attribute(:marketplace_id) do
        text_at_xpath("MarketplaceId")
      end

      attribute(:asin) do
        text_at_xpath("ASIN")
      end
    end
  end
end
