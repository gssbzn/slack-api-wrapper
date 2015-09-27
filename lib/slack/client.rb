# Copyright (c) 2015 Gustavo Bazan
# MIT License

require_relative 'session'
require_relative 'web'

module Slack
  # Use this class to make Slack API calls.
  # You'll need to obtain an OAuth 2 access token
  class Client
    include Web

    # @param [String] oauth2_access_token user token
    def initialize(oauth2_access_token)
      unless oauth2_access_token.is_a?(String)
        fail ArgumentError, 'bad type for oauth2_access_token (expecting String)'
      end
      @session = Session.new(oauth2_access_token)
    end
  end
end
