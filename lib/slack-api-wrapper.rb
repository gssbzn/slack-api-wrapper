require 'net/https'
require 'cgi'
require 'json'

require_relative 'slack/version'
require_relative 'slack/error'
require_relative 'slack/session'
require_relative 'slack/client'

# Copyright (c) 2015 Gustavo Bazan
# MIT License
#
# The module that contains everything Slack-related:
#
# * {Slack::Client} is the class used to interact with the slack end points.
# * {Slack::Error} is raised when Slack encounters an error.
#
module Slack
  # Slack url
  WEB_SERVER = 'slack.com'

  # Parse response. You probably shouldn't be calling this directly.
  # This takes responses from the server and parses them.
  # It also checks for errors and raises exceptions with the appropriate messages.
  #
  # @param [Net::HTTPResponse] response
  # @param [Boolean] raw if return raw data
  # @raise [SlackError]
  # @raise [SlackAuthError]
  def self.parse_response(response, raw = false)
    if response.is_a?(Net::HTTPServerError)
      fail Slack::Error.new("Slack Server Error: #{response} - #{response.body}", response)
    end
    return response.body if raw
    d = JSON.parse(response.body)
    fail Slack::Error.new(d['error'], response) if d['error']
    return d
  rescue JSON::ParserError
    raise Slack::Error.new("Unable to parse JSON response: #{response.body}", response)
  end
end
