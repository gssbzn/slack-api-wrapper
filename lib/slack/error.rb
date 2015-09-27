# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  # This is the usual error raised on any Slack related Errors
  # @!attribute http_response
  #   @return [Object] server response
  # @!attribute error
  #   @return [String] the name of the error
  class Error < RuntimeError
    attr_accessor :http_response, :error

    def initialize(error, http_response = nil)
      @error = error
      @http_response = http_response
    end

    # String representation
    # @return [String]
    def to_s
      "#{error}"
    end
  end
end
