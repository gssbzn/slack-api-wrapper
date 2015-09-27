# Copyright (c) 2015 Gustavo Bazan
# MIT License
require_relative 'request'

module Slack
  class Session # :nodoc:
    include Request

    # @param [String] oauth2_access_token user token
    def initialize(oauth2_access_token)
      unless oauth2_access_token.is_a?(String)
        fail ArgumentError, 'bad type for oauth2_access_token (expecting String)'
      end
      @access_token = oauth2_access_token
    end

    def do_get(path, params = nil) # :nodoc:
      params ||= {}
      params['token'] = @access_token
      uri = build_url_with_params(path, params)
      do_http(uri, Net::HTTP::Get.new(uri.request_uri))
    end

    def do_http_with_body(uri, request, body) # :nodoc:
      unless body.nil?
        if body.is_a?(Hash)
          request.set_form_data clean_params(body)
        else
          s = body.to_s
          request['Content-Length'] = s.length
          request.body = s
        end
      end
      do_http(uri, request)
    end

    def do_post(path, params = nil, headers = nil) # :nodoc:
      headers ||= {}
      headers['Authorization'] = "Bearer #{@access_token}"
      params ||= {}
      params['token'] = @access_token
      uri = build_url(path)
      do_http_with_body(uri, Net::HTTP::Post.new(uri.request_uri, headers), params)
    end

    private

    def build_url(path) # :nodoc:
      full_path = "/api/#{path}"
      URI::HTTPS.build(host: Slack::WEB_SERVER, path: full_path)
    end

    def build_url_with_params(path, params) # :nodoc:
      target = build_url(path)
      target.query = make_query_string(params)
      target
    end
  end
end
