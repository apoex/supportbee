module SupportBee
  class Client
    module Tickets
      def tickets(extra_parameters = {})
        # Convert parameter keys to strings
        extra_parameters = Hash[extra_parameters.map{|(k,v)| [k.to_s,v]}]

        # Default parameters according to
        # https://developers.SupportBee.com/api
        filters = ['spam', 'trash', 'archived']

        filters.each do |filter|
          extra_parameters[filter] = false if extra_parameters[filter].nil?
        end

        tickets = get_index('tickets', extra_parameters)
      end

      def ticket(id)
        response = @conn.get "/tickets/#{id}.json"
        JSON.parse(response.body)
      end
    end
  end
end
