require "mws/core/entity"

module MWS
  module Products
    class Error < Core::Entity
      attribute(:code) do
        text_at_xpath("Code")
      end

      attribute(:type) do
        text_at_xpath("Type")
      end

      attribute(:message) do
        text_at_xpath("Message")
      end
    end
  end
end
