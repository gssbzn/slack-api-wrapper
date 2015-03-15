# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the channels methods.
    # Get info on your team's Slack channels, create or archive channels,
    # invite users, set the topic and purpose, and mark a channel as read.
    module Channels
      # Endpoint scope
      SCOPE = "channels"

      # Archives a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to archive
      #
      # @see https://api.slack.com/methods/channels.archive
      def channels_archive(params = {})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.archive", params
        Slack::parse_response(response)
      end

      # Creates a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'name'
      #   Name of channel to create
      #
      # @see https://api.slack.com/methods/channels.create
      def channels_create(params = {})
        raise ArgumentError.new("Required arguments 'name' missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.create", params
        Slack::parse_response(response)
      end

      # Fetches history of messages and events from a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to fetch history for.
      # @option params [timestamp] 'latest'
      #   Latest message timestamp to include in results.
      # @option params [timestamp] 'oldest'
      #   Oldest message timestamp to include in results.
      # @option params [Object] 'inclusive'
      #   Include messages with latest or oldest timestamp in results.
      # @option params [Object] 'count'
      #   Number of messages to return, between 1 and 1000.
      #
      # @see https://api.slack.com/methods/channels.history
      def channels_history(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.history", params
        Slack::parse_response(response)
      end

      # Gets information about a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to get info on
      #
      # @see https://api.slack.com/methods/channels.info
      def channels_info(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.info", params
        Slack::parse_response(response)
      end

      # Invites a user to a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to invite user to.
      # @option params [user] 'user'
      #   User to invite to channel.
      #
      # @see https://api.slack.com/methods/channels.invite
      def channels_invite(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'user' missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.invite", params
        Slack::parse_response(response)
      end

      # Joins a channel, creating it if needed.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'name'
      #   Name of channel to join
      #
      # @see https://api.slack.com/methods/channels.join
      def channels_join(params={})
        raise ArgumentError.new("Required arguments 'name' missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.join", params
        Slack::parse_response(response)
      end

      # Removes a user from a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to remove user from.
      # @option params [user] 'user'
      #   User to remove from channel.
      #
      # @see https://api.slack.com/methods/channels.kick
      def channels_kick(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'user' missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.kick", params
        Slack::parse_response(response)
      end

      # Leaves a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to leave
      # @see https://api.slack.com/methods/channels.leave
      def channels_leave(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.leave", params
        Slack::parse_response(response)
      end

      # Lists all channels in a Slack team.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'exclude_archived'
      #   Don't return archived channels.
      #
      # @see https://api.slack.com/methods/channels.list
      def channels_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

      # Sets the read cursor in a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to set reading cursor in.
      # @option params [timestamp] 'ts'
      #   Timestamp of the most recently seen message.
      #
      # @see https://api.slack.com/methods/channels.mark
      def channels_mark(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'ts' missing") if params['ts'].nil?
        response = @session.do_get "#{SCOPE}.mark", params
        Slack::parse_response(response)
      end

      # Renames a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to rename
      # @option params [Object] 'name'
      #   New name for channel.
      #
      # @see https://api.slack.com/methods/channels.rename
      def channels_rename(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'name' missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.rename", params
        Slack::parse_response(response)
      end

      # Sets the purpose for a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to set the purpose of
      # @option params [Object] 'purpose'
      #   The new purpose
      #
      # @see https://api.slack.com/methods/channels.setPurpose
      def channels_set_purpose(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'purpose' missing") if params['purpose'].nil?
        response = @session.do_get "#{SCOPE}.setPurpose", params
        Slack::parse_response(response)
      end

      # Sets the topic for a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to set the topic of
      # @option params [Object] 'topic'
      #   The new topic
      # @raise [ArgumentError] if 'channel' or 'topic' are not present
      # @see https://api.slack.com/methods/channels.setTopic
      def channels_set_topic(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'topic' missing") if params['topic'].nil?
        response = @session.do_get "#{SCOPE}.setTopic", params
        Slack::parse_response(response)
      end

      # Unarchives a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [channel] 'channel'
      #   Channel to unarchive
      # @raise [ArgumentError] if 'channel' is not present
      # @see https://api.slack.com/methods/channels.unarchive
      def channels_unarchive(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.unarchive", params
        Slack::parse_response(response)
      end

    end
  end
end
