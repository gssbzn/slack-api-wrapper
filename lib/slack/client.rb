# Copyright (c) 2015 Gustavo Bazan
# MIT License

require_relative 'session'
require_relative 'web'

module Slack
  # Use this class to make Slack API calls.  You'll need to obtain an OAuth 2 access token
  # first; you can get one using {Slack::OAuth2::Flow}.
  class Client
    include Web

    # @param [String] oauth2_access_token user token
    def initialize(oauth2_access_token)
      if oauth2_access_token.is_a?(String)
        @session = Session.new(oauth2_access_token)
      else
        raise ArgumentError.new("oauth2_access_token doesn't have a valid type")
      end
    end
  end
end
