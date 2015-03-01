# This is the usual error raised on any Slack related Errors
module Slack
  class Error < RuntimeError
    attr_accessor :http_response, :error
    def initialize(error, http_response=nil)
      @error = error
      @http_response = http_response
    end

    def to_s
      "#{error}"
    end
  end

  # This is the error raised on Authentication failures.  Usually this means
  # one of three things
  # * Your user failed to go to the authorize url and approve your application
  # * You set an invalid or expired token and secret on your Session
  # * Your user deauthorized the application after you stored a valid token and secret
  class AuthError < Error; end
end
