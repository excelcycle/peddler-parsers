require "mws/core/entity"

module MWS
  module Products
    class Qualifiers < Core::Entity
      attribute(:item_condition) do
        text_at_xpath("ItemCondition")
      end

      attribute(:item_subcondition) do
        text_at_xpath("ItemSubcondition")
      end

      attribute(:fulfillment_channel) do
        text_at_xpath("FulfillmentChannel")
      end

      attribute(:ships_domestically) do
        text_at_xpath("ShipsDomestically")
      end

      attribute(:shipping_time) do
        text_at_xpath("ShippingTime")
      end

      attribute(:seller_positive_feedback_rating) do
        text_at_xpath("SellerPositiveFeedbackRating")
      end
    end
  end
end
