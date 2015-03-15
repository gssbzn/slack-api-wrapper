module Slack
  module Web
    module Team
      SCOPE = "api"

      # Checks API calling code.
      def api_test(params={})
        response = @session.do_get "#{SCOPE}.test", params
        Slack::parse_response(response)
      end

    end
  end
end
