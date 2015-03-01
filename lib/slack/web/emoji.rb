module Slack
  module Web
    module Emoji
      SCOPE = "emoji"

      # Lists custom emoji for a team.
      def emoji_list
        response = @session.do_get "#{SCOPE}.list"
        Slack::parse_response(response)
      end
    end
  end
end
