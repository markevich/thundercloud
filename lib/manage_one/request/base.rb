require "net/http"
require 'openssl'
require 'json'

module ManageOne
  module Request
    class Base
      # TODO
      # extract this to yml
      API_PATH = 'https://178.159.255.56:643/goku/rest/v1.5'

      def get(path)
        uri = build_uri(path, params)

        req = Net::HTTP::Get.new(uri)

        send_request(req, uri)
      end

      def post(path)
        uri = build_uri(path)

        req = Net::HTTP::Post.new(uri)

        req.body = params.to_json

        send_request(req, uri)
      end

      def put(path)
        uri = build_uri(path)

        req = Net::HTTP::Put.new(uri)

        req.body = params.to_json

        send_request(req, uri)
      end

      def build_uri(path, uri_params = {})
        url = api_url(path)
        uri = URI(url)

        uri.query = URI.encode_www_form(uri_params)

        uri
      end

      def api_url(path)
        "#{API_PATH}#{path}"
      end

      def send_request(request, uri)
        default_headers.merge(headers).each do |key, value|
          request[key] = value
        end

        puts request.to_hash

        response = http(uri.host, uri.port).request(request)
binding.pry
        JSON.parse(response.body)
      end

      def http(host, port)
        net_http = Net::HTTP.new(host, port)
        net_http.use_ssl = true
        net_http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        net_http
      end

      def default_headers
        {
          'Content-Type' => 'application/json',
          'User-Agent'   => 'Apache-HttpClient/4.3.5 (java 1.5)'
        }
      end

      def params
        {}
      end

      def headers
        {}
      end
    end
  end
end
