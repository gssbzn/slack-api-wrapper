require_relative 'session'
require_relative 'web'

module Slack
  # Use this class to make Slack API calls.  You'll need to obtain an OAuth 2 access token
  # first; you can get one using either SlackOAuth2Flow.
  class Client
    include Web

    # Args:
    # * +oauth2_access_token+: Obtained via Slack::OAuth2::Flow or Slack::OAuth2::FlowNoRedirect.
    def initialize(oauth2_access_token)
      if oauth2_access_token.is_a?(String)
        @session = OAuth2Session.new(oauth2_access_token)
      else
        raise ArgumentError.new("oauth2_access_token doesn't have a valid type")
      end
    end
  end
end
