module Slack
  module Web
    module Auth
      def auth_test(params={})
        response = @session.do_get "auth.test", params
        Slack::parse_response(response)
      end
    end
  end
end
