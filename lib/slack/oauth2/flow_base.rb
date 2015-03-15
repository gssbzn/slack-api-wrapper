# Copyright (c) 2015 Gustavo Bazan
# MIT License

require 'uri'

module Slack
  module Oauth2
    # Base class for the OAuth 2 authorization helpers.
    class FlowBase
      def initialize(consumer_key, consumer_secret, scope, team)
        unless consumer_key.is_a?(String)
          raise ArgumentError, "consumer_key must be a String, got #{consumer_key.inspect}"
        end
        unless consumer_secret.is_a?(String)
          raise ArgumentError, "consumer_secret must be a String, got #{consumer_secret.inspect}"
        end
        unless scope.is_a?(String)
          raise ArgumentError, "scope must be a String, got #{scope.inspect}"
        end

        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
        @scope = scope
        @team = team
      end

      protected

      def _get_authorize_url(redirect_uri, state)
        params = {
          "client_id" => @consumer_key,
          "redirect_uri" => redirect_uri,
          "scope" => @scope,
          "state" => state,
          "team" => @team
        }

        host = Slack::WEB_SERVER
        path = "/oauth/authorize"

        target = URI::Generic.new("https", nil, host, nil, nil, path, nil, nil, nil)
        target.query = Slack::make_query_string(params)

        target.to_s
      end

      # Finish the OAuth 2 authorization process.  If you used a redirect_uri, pass that in.
      # Will return an access token string that you can use with SlackClient.
      def _finish(code, original_redirect_uri)

        raise ArgumentError, "code must be a String" unless code.is_a?(String)

        uri = URI.parse("https://#{Slack::API_SERVER}/oauth.access")
        request = Net::HTTP::Post.new(uri.request_uri)

        params = {
          "client_id" => @consumer_key,
          "client_secret" => @consumer_secret,
          "code" => code,
          "redirect_uri" => original_redirect_uri
        }

        request.set_form_data(Slack::clean_params(params))

        response = Slack::do_http(uri, request)

        j = Slack::parse_response(response)
        ["access_token", "scope"].each do |k|
          unless j.has_key?(k)
            raise Slack::Error.new("Bad response from /token: missing \"#{k}\".")
          end
          unless j[k].is_a?(String)
            raise Slack::Error.new("Bad response from /token: field \"#{k}\" is not a string.")
          end
        end

        return j['access_token'], j['scope']
      end
    end
  end
end
