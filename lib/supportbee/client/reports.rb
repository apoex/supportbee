module SupportBee
  class Client
    module Reports
      def avg_first_response_time(extra_parameters = {})
        reports('avg_first_response_time', extra_parameters)
      end

      def tickets_count(extra_parameters = {})
        reports('tickets_count', extra_parameters)
      end

      def replies_count(extra_parameters = {})
        reports('replies_count', extra_parameters)
      end

      private

      def reports(endpoint, extra_parameters)
        # Convert parameter keys to strings
        extra_parameters = Hash[extra_parameters.map{|(k,v)| [k.to_s,v]}]

        response = @conn.get do |req|
          req.url "/reports/#{endpoint}.json"
          req.params.merge!(extra_parameters)
        end

        JSON.parse(response.body)
      end
    end
  end
end
