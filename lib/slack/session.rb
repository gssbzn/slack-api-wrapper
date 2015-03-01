module Slack

  class OAuth2Session # :nodoc:

    def initialize(oauth2_access_token)
      unless oauth2_access_token.is_a?(String)
        raise "bad type for oauth2_access_token (expecting String)"
      end
      @access_token = oauth2_access_token
    end

    private

    def build_url(path)
      host = Slack::WEB_SERVER
      full_path = "/api/#{path}"
      URI::HTTPS.build({host: host, path: full_path})
    end

    def build_url_with_params(path, params) # :nodoc:
      target = build_url(path)
      target.query = Slack::make_query_string(params)
      target
    end

    protected

    def do_http(uri, request) # :nodoc:
      Slack::do_http(uri, request)
    end

    public

    def do_get(path, params=nil, headers=nil)  # :nodoc:
      params ||= {}
      params["token"] = @access_token
      uri = build_url_with_params(path, params)
      do_http(uri, Net::HTTP::Get.new(uri.request_uri))
    end

    def do_http_with_body(uri, request, body)
      if body != nil
        if body.is_a?(Hash)
          request.set_form_data(Slack::clean_params(body))
        elsif body.respond_to?(:read)
          if body.respond_to?(:length)
            request["Content-Length"] = body.length.to_s
          elsif body.respond_to?(:stat) && body.stat.respond_to?(:size)
            request["Content-Length"] = body.stat.size.to_s
          else
            raise ArgumentError, "Don't know how to handle 'body' (responds to 'read' but not to 'length' or 'stat.size')."
          end
          request.body_stream = body
        else
          s = body.to_s
          request["Content-Length"] = s.length
          request.body = s
        end
      end
      do_http(uri, request)
    end

    def do_post(path, params=nil, headers=nil)  # :nodoc:
      params ||= {}
      params["token"] = @access_token
      uri = build_url(path)
      do_http_with_body(uri, Net::HTTP::Post.new(uri.request_uri, headers), params)
    end

    def do_put(path, params=nil, headers=nil, body=nil)  # :nodoc:
      params ||= {}
      params["token"] = @access_token
      uri = build_url_with_params(path, params)
      do_http_with_body(uri, Net::HTTP::Put.new(uri.request_uri, headers), body)
    end
  end
end
