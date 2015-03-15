module Slack
  module Web
    module Team
      SCOPE = "team"

      # Gets the access logs for a team.
      def team_access_logs(params={})
        response = @session.do_get "#{SCOPE}.accessLogs", params
        Slack::parse_response(response)
      end

    end
  end
end
