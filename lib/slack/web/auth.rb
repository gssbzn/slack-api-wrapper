module Slack
  module Web
    module Auth
      def auth_test
        response = @session.do_get "auth.test"
        Slack::parse_response(response)
      end
    end
  end
end
