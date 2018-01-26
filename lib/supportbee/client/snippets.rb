module SupportBee
  class Client
    module Snippets
      def snippets(extra_parameters = {})
        get_index('snippets', extra_parameters)
      end
    end
  end
end
