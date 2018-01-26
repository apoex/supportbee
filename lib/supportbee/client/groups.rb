module SupportBee
  class Client
    module Groups
      def groups(extra_parameters = {})
        get_index('groups', extra_parameters)
      end
    end
  end
end
