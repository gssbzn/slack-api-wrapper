require 'securerandom'

require_relative 'flow_base'

module Slack
  module OAuth2
    # The standard OAuth 2 authorization helper.  Use this if you're writing a web app.
    class Flow < FlowBase

      # * consumer_key: Your Slack API app's "app key"
      # * consumer_secret: Your Slack API app's "app secret"
      # * redirect_uri: The URI that the Slack server will redirect the user to after the user
      #   finishes authorizing your app.  This URI  must be HTTPs-based and pre-registered with
      #   the Slack servers.
      # * session: A hash that represents the current web app session (will be used to save the CSRF
      #   token)
      # * csrf_token_key: The key to use when storing the CSRF token in the session (for example,
      #   :slack_auth_csrf_token)
      def initialize(consumer_key, consumer_secret, redirect_uri, scope, team, session, csrf_token_session_key)
        super(consumer_key, consumer_secret, scope, team)
        unless redirect_uri.is_a?(String)
          raise ArgumentError, "redirect_uri must be a String, got #{consumer_secret.inspect}"
        end
        @redirect_uri = redirect_uri
        @session = session
        @csrf_token_session_key = csrf_token_session_key
      end

      # Starts the OAuth 2 authorizaton process, which involves redirecting the user to
      # the returned "authorization URL" (a URL on the Slack website).  When the user then
      # either approves or denies your app access, Slack will redirect them to the
      # redirect_uri you provided to the constructor, at which point you should call finish()
      # to complete the process.
      #
      # This function will also save a CSRF token to the session and csrf_token_session_key
      # you provided to the constructor.  This CSRF token will be checked on finish() to prevent
      # request forgery.
      #
      # * url_state: Any data you would like to keep in the URL through the authorization
      #   process.  This exact value will be returned to you by finish().
      #
      # Returns the URL to redirect the user to.
      def start(url_state=nil)
        unless url_state.nil? or url_state.is_a?(String)
          raise ArgumentError, "url_state must be a String"
        end

        csrf_token = SecureRandom.base64(16)
        state = csrf_token
        unless url_state.nil?
            state += "|" + url_state
        end
        @session[@csrf_token_session_key] = csrf_token
        _get_authorize_url(@redirect_uri, state)
      end

      # Call this after the user has visited the authorize URL (see: start()), approved your app,
      # and was redirected to your redirect URI.
      #
      # * query_params: The query params on the GET request to your redirect URI.
      #
      # Returns a tuple of (access_token, scope, url_state).  access_token can be used to
      # construct a SlackClient.  scpe is the Slack scope the user that jsut approved
      # your app.  url_state is the value you originally passed in to start().
      #
      # Can throw BadRequestError, BadStateError, CsrfError, NotApprovedError,
      # ProviderError.
      def finish(query_params)
        csrf_token_from_session = @session[@csrf_token_session_key]

        # Check well-formedness of request.

        # Check well-formedness of request.

        state = query_params['state']
        if state.nil?
          raise BadRequestError.new("Missing query parameter 'state'.")
        end
        code = query_params['code']

        error = query_params['error']

        unless error.nil? || code.nil?
          raise BadRequestError.new("Query parameters 'code' and 'error' are both set;" +
          " only one must be set.")
        end
        if error.nil? && code.nil?
          raise BadRequestError.new("Neither query parameter 'code' or 'error' is set.")
        end

        # Check CSRF token

        if csrf_token_from_session.nil?
          raise BadStateError.new("Missing CSRF token in session.");
        end
        unless csrf_token_from_session.length > 20
          raise RuntimeError.new("CSRF token unexpectedly short: #{csrf_token_from_session.inspect}")
        end

        split_pos = state.index('|')
        if split_pos.nil?
          given_csrf_token = state
          url_state = nil
        else
          given_csrf_token, url_state = state.split('|', 2)
        end
        unless Slack::safe_string_equals(csrf_token_from_session, given_csrf_token)
          raise CsrfError.new("Expected #{csrf_token_from_session.inspect}, " +
                              "got #{given_csrf_token.inspect}.")
        end
        @session.delete(@csrf_token_session_key)

        # Check for error identifier

        unless error.nil?
          if error == 'access_denied'
            # The user clicked "Deny"
            raise NotApprovedError.new("No additional description from Slack.")
          else
            raise ProviderError.new(error)
          end
        end

        # If everything went ok, make the network call to get an access token.

        access_token, scope = _finish(code, @redirect_uri)
        return access_token, scope, url_state
      end

      # Thrown if the redirect URL was missing parameters or if the given parameters were not valid.
      #
      # The recommended action is to show an HTTP 400 error page.
      class BadRequestError < Exception; end

      # Thrown if all the parameters are correct, but there's no CSRF token in the session.  This
      # probably means that the session expired.
      #
      # The recommended action is to redirect the user's browser to try the approval process again.
      class BadStateError < Exception; end

      # The user chose not to approve your app.
      class NotApprovedError < Exception; end

      # Thrown if the given 'state' parameter doesn't contain the CSRF token from the user's session.
      # This is blocked to prevent CSRF attacks.
      #
      # The recommended action is to respond with an HTTP 403 error page.
      class CsrfError < Exception; end

      # Slack redirected to your redirect URI with some unexpected error identifier and error
      # message.
      class ProviderError < Exception; end
    end
  end
end
