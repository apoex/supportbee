module SupportBee
  class Client
    module Users
      def users(extra_parameters = {})
        # Convert parameter keys to strings
        extra_parameters = Hash[extra_parameters.map{|(k,v)| [k.to_s,v]}]

        users = get_index('users', extra_parameters)
      end

      def user(id)
        response = @conn.get "/users/#{id}.json"
        JSON.parse(response.body)
      end
    end
  end
end
