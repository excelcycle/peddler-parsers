require "mws/core/entity"

module MWS
  module Products
    class SellerSKUIdentifier < Core::Entity
      attribute(:marketplace_id) do
        text_at_xpath("MarketplaceId")
      end

      attribute(:seller_id) do
        text_at_xpath("SellerId")
      end

      attribute(:seller_sku) do
        text_at_xpath("SellerSKU")
      end
    end
  end
end
