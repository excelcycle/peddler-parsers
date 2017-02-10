module MWS
  module Core
    module Tokenable
      def next_token
        node = xpath('NextToken').first
        node.text if node
      end
    end
  end
end
