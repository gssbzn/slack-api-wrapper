# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the chat methods.
    # Post chat messages to Slack.
    module Chat
      # Endpoint scope
      SCOPE = "chat"

      # Deletes a message.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'ts'
      #   Timestamp of the message to be deleted.
      # @option params [channel] 'channel'
      #   Channel containing the message to be deleted.
      #
      # @see https://api.slack.com/methods/chat.delete
      def chat_delete(params={})
        raise ArgumentError.new("Required arguments 'ts' missing") if params['ts'].nil?
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.delete", params
        Slack::parse_response(response)
      end

      # Sends a message to a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to send message to. Can be a public channel, private group or IM channel. Can be an encoded ID, or a name.
      # @option params [Object] 'text'
      #   Text of the message to send.
      # @option params [Object] 'username'
      #   Name of bot.
      # @option params [Object] 'as_user'
      #   Pass true to post the message as the authed user, instead of as a bot
      # @option params [Object] 'parse'
      #   Change how messages are treated.
      # @option params [Object] 'link_names'
      #   Find and link channel names and usernames.
      # @option params [Object] 'attachments'
      #   Structured message attachments.
      # @option params [Object] 'unfurl_links'
      #   Pass true to enable unfurling of primarily text-based content.
      # @option params [Object] 'unfurl_media'
      #   Pass false to disable unfurling of media content.
      # @option params [Object] 'icon_url'
      #   URL to an image to use as the icon for this message
      # @option params [Object] 'icon_emoji'
      #   emoji to use as the icon for this message. Overrides `icon_url`.
      #
      # @see https://api.slack.com/methods/chat.postMessage
      def chat_post_message(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'text' missing") if params['text'].nil?
        response = @session.do_get "#{SCOPE}.postMessage", params
        Slack::parse_response(response)
      end

      # Updates a message.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'ts'
      #   Timestamp of the message to be updated.
      # @option params [channel] 'channel'
      #   Channel containing the message to be updated.
      # @option params [Object] 'text'
      #   New text for the message, using the default formatting rules.
      #
      # @see https://api.slack.com/methods/chat.update
      def chat_update(params={})
        raise ArgumentError.new("Required arguments 'ts' missing") if params['ts'].nil?
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'text' missing") if params['text'].nil?
        response = @session.do_get "#{SCOPE}.update", params
        Slack::parse_response(response)
      end

    end
  end
end
