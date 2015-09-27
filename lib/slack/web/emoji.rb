# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the emoji methods.
    module Emoji
      # Endpoint scope
      SCOPE = 'emoji'

      # Lists custom emoji for a team.
      #
      # @param [Hash] params
      #   API call arguments
      #
      # @see https://api.slack.com/methods/emoji.list
      def emoji_list(params = {})
        response = @session.do_post "#{SCOPE}.list", params
        Slack.parse_response(response)
      end
    end
  end
end
