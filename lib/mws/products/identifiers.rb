require "mws/core/entity"
require "mws/products/marketplace_asin"
require "mws/products/seller_sku_identifier"

module MWS
  module Products
    class Identifiers < Core::Entity
      attribute(:marketplace_asin) do
        if node = xpath("MarketplaceASIN").first
          MarketplaceASIN.new(node)
        end
      end
      attribute(:sku_identifier) do
        if node = xpath("SKUIdentifier").first
          SellerSKUIdentifier.new(node)
        end
      end
    end
  end
end
