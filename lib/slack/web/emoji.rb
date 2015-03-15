module Slack
  module Web
    module Emoji
      SCOPE = "emoji"

      # Lists custom emoji for a team.
      def emoji_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end
    end
  end
end
