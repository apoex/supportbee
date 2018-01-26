module SupportBee
  class Client
    module WebHooks
      def web_hooks(extra_parameters = {})
        get_index('web_hooks', extra_parameters)
      end
    end
  end
end
