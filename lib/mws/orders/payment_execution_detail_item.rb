require "mws/core/entity"

module MWS
  module Orders
    class PaymentExecutionDetailItem < Core::Entity
      attribute(:payment) do
        money_at_xpath("Payment")
      end

      attribute(:payment_method) do
        text_at_xpath("PaymentMethod")
      end
    end
  end
end
