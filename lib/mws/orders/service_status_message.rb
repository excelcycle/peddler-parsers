require "mws/core/entity"

module MWS
  module Orders
    class ServiceStatusMessage < Core::Entity
      attribute(:locale) do
        text_at_xpath("Locale")
      end

      attribute(:text) do
        text_at_xpath("Text")
      end
    end
  end
end
