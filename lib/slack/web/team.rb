# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the teams methods.
    module Team
      # Endpoint scope
      SCOPE = 'team'

      # Gets the access logs for a team.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'count'
      #   Number of items to return per page.
      # @option params [Object] 'page'
      #   Page number of results to return.
      #
      # @see https://api.slack.com/methods/team.access_logs
      def team_access_logs(params = {})
        response = @session.do_post "#{SCOPE}.accessLogs", params
        Slack.parse_response(response)
      end

      # This method provides information about your team.
      #
      # @param [Hash] params
      #   API call arguments
      def team_info(params = {})
        response = @session.do_post "#{SCOPE}.info", params
        Slack.parse_response(response)
      end
    end
  end
end
