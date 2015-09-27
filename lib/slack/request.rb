module Slack
  module Request
    # Removes nil params
    #
    # @param [Hash] params
    #   API call arguments
    # @return [Hash]
    def clean_params(params)
      r = {}
      params.each do |k, v|
        r[k] = v.to_s unless v.nil?
      end
      r
    end

    # Convert params to query string
    #
    # @param [Hash] params
    #   API call arguments
    # @return [String]
    def make_query_string(params)
      clean_params(params).collect do |k, v|
        CGI.escape(k) + '=' + CGI.escape(v)
      end.join('&')
    end

    # Handle http requests
    # @param [URI::HTTPS] uri
    #   API uri
    # @param [Object] request
    #   request object
    # @return [Net::HTTPResponse]
    def do_http(uri, request)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      # Let then know about us
      request['User-Agent'] = 'SlackRubyAPIWrapper'
      begin
        http.request(request)
      rescue OpenSSL::SSL::SSLError => e
        raise Slack::Error, 'SSL error connecting to Slack.'
      end
    end
  end
end
