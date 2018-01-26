module SupportBee
  class Client
    module Labels
      def labels(extra_parameters = {})
        get_index('labels', extra_parameters)
      end
    end
  end
end
