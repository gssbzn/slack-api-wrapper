module Slack
  module Web
    # Module for the ractions methods.
    module Reactions
      # Endpoint scope
      SCOPE = 'reactions'

      # This method adds a reaction (emoji) to an item
      # (file, file comment, channel message, group message, or direct message).
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'name'
      #  	Reaction (emoji) name.
      # @option params [Object] 'file'
      #   File to add reaction to.
      # @option params [Object] 'file_comment'
      #   File comment to add reaction to.
      # @option params [Object] 'channel'
      #  	Channel where the message to add reaction to was posted.
      # @option params [Object] 'timestamp'
      #   Timestamp of the message to add reaction to.
      #
      # @see https://api.slack.com/methods/reactions.add
      def reactions_add(params = {})
        fail ArgumentError, "Required arguments 'name' missing" if params['name'].nil?
        response = @session.do_post "#{SCOPE}.add", params
        Slack.parse_response(response)
      end

      # This method returns a list of all reactions for a single item
      # (file, file comment, channel message, group message, or direct message).
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'file'
      #   File to get reactions for.
      # @option params [Object] 'file_comment'
      #   File comment to get reactions for.
      # @option params [Object] 'channel'
      #  	Channel where the message to get reactions for was posted.
      # @option params [Object] 'timestamp'
      #   Timestamp of the message to get reactions for.
      # @option params [Object] 'full'
      #   If true always return the complete reaction list.
      #
      # @see https://api.slack.com/methods/reactions.get
      def reactions_get(params = {})
        response = @session.do_post "#{SCOPE}.add", params
        Slack.parse_response(response)
      end

      # This method returns a list of all items (file, file comment,
      # channel message, group message, or direct message) reacted to by a user.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'user'
      #  	Show reactions made by this user. Defaults to the authed user.
      # @option params [Object] 'full'
      #   If true always return the complete reaction list.
      # @option params [Object] 'count'
      #   Number of items to return per page.
      # @option params [Object] 'page'
      #   Page number of results to return.
      #
      # @see https://api.slack.com/methods/reactions.list
      def reactions_list(params = {})
        response = @session.do_post "#{SCOPE}.list", params
        Slack.parse_response(response)
      end

      # This method removes a reaction (emoji) from an item (file, file comment,
      # channel message, group message, or direct message)
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'name'
      #  	Reaction (emoji) name.
      # @option params [Object] 'file'
      #   File to remove reaction from.
      # @option params [Object] 'file_comment'
      #   File comment to remove reaction from.
      # @option params [Object] 'channel'
      #  	Channel where the message to remove reaction from was posted.
      # @option params [Object] 'timestamp'
      #   Timestamp of the message to remove reaction from.
      #
      # @see https://api.slack.com/methods/reactions.remove
      def reactions_remove(params = {})
        fail ArgumentError, "Required arguments 'name' missing" if params['name'].nil?
        response = @session.do_post "#{SCOPE}.remove", params
        Slack.parse_response(response)
      end
    end
  end
end
