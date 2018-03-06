Gem.find_files('supportbee/client/**/*.rb').each { |f| require f }

module SupportBee
  class Client
    include SupportBee::Client::Agents
    include SupportBee::Client::Labels
    include SupportBee::Client::Groups
    include SupportBee::Client::Reports
    include SupportBee::Client::Snippets
    include SupportBee::Client::Tickets
    include SupportBee::Client::Users
    include SupportBee::Client::WebHooks

    def initialize(options = {})
      @company    = options[:company]
      @auth_token = options[:auth_token]

      @conn = Faraday.new(url: host) do |faraday|
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        faraday.request  :url_encoded             # form-encode POST params
        # faraday.response :logger                  # log requests to STDOUT

        faraday.params[:auth_token] = @auth_token
      end
    end

    def host
      @host ||= "https://#{@company}.supportbee.com"
    end

    def request(url, options = {})
      method = options[:method].nil? ? :get : options[:method]
      response = @conn.run_request(method, url, options[:body], options[:headers])
      JSON.parse(response.body)
    end

    def get_index(endpoint, extra_parameters = {})
      items = []
      current_page = 1
      last_page = false

      until last_page
        extra_parameters['page'] = current_page

        raw_response = @conn.get do |req|
          req.url "/#{endpoint}.json"
          req.params.merge!(extra_parameters)
        end

        response = JSON.parse(raw_response.body)
        items.concat(response[endpoint])

        if response['current_page'].to_i >= response['total_pages'].to_i
          last_page = true
        else
          current_page = current_page + 1
        end
      end

      items
    end
  end
end
