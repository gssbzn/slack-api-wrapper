require 'net/https'
require 'cgi'
require 'json'

require_relative "slack/version"
require_relative "slack/error"
require_relative "slack/session"
require_relative "slack/oauth2"
require_relative "slack/client"

# Copyright (c) 2015 Gustavo Bazan
# MIT License
#
# The module that contains everything Slack-related:
#
# * {Slack::Client} is the class used to interact with the slack end points.
# * {Slack::Error} is raised when Slack encounters an error.
# * {Slack::Oauth2} handles oauth2 authentication.
#
module Slack
  # Slack url
  WEB_SERVER = 'slack.com'
  # Slack api path
  API_SERVER = 'slack.com/api'

  # Removes nil params
  #
  # @param [Hash] params
  #   API call arguments
  # @return [Hash]
  def self.clean_params(params)
    r = {}
    params.each do |k,v|
      r[k] = v.to_s unless v.nil?
    end
    r
  end

  # Convert params to query string
  #
  # @param [Hash] params
  #   API call arguments
  # @return [String]
  def self.make_query_string(params)
    clean_params(params).collect {|k,v|
      CGI.escape(k) + "=" + CGI.escape(v)
    }.join("&")
  end

  # Handle http requests
  # @param [URI::HTTPS] uri
  #   API uri
  # @param [Object] request
  #   request object
  # @return [Net::HTTPResponse]
  def self.do_http(uri, request)

    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true

    # Let then know about us
    request['User-Agent'] =  "SlackRubyAPIWrapper"

    begin
      http.request(request)
    rescue OpenSSL::SSL::SSLError => e
      raise SlackError.new("SSL error connecting to Slack.")
    end
  end

  # Parse response. You probably shouldn't be calling this directly.  This takes responses from the server
  # and parses them.  It also checks for errors and raises exceptions with the appropriate messages.
  # @param [Net::HTTPResponse] response
  # @param [Boolean] raw if return raw data
  # @raise [SlackError]
  # @raise [SlackAuthError]
  def self.parse_response(response, raw=false)
    if response.kind_of?(Net::HTTPServerError)
      raise SlackError.new("Slack Server Error: #{response} - #{response.body}", response)
    elsif response.kind_of?(Net::HTTPUnauthorized)
      raise SlackAuthError.new("User is not authenticated.", response)
    elsif !response.kind_of?(Net::HTTPSuccess)
      begin
        d = JSON.parse(response.body)
      rescue
        raise SlackError.new("Slack Server Error: body=#{response.body}", response)
      end
      if d['error']
        raise SlackError.new(d['error'], response)
      else
        raise SlackError.new(response.body, response)
      end
    end

    return response.body if raw

    begin
      return JSON.parse(response.body)
    rescue JSON::ParserError
      raise SlackError.new("Unable to parse JSON response: #{response.body}", response)
    end
  end

  # A string comparison function that is resistant to timing attacks.  If you're comparing a
  # string you got from the outside world with a string that is supposed to be a secret, use
  # this function to check equality.
  # @param [String] a
  # @param [String] b
  # @return [Boolean] whether the strings are equal
  def self.safe_string_equals(a, b)
    if a.length != b.length
      false
    else
      a.chars.zip(b.chars).map {|ac,bc| ac == bc}.all?
    end
  end
end
