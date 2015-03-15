# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the groups methods.
    # Get info on your team's private groups.
    module Groups
      # Endpoint scope
      SCOPE = "groups"

      # Archives a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Private group to archive
      #
      # @see https://api.slack.com/methods/groups.archive
      def groups_archive(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.archive", params
        Slack::parse_response(response)
      end

      # Closes a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Group to close.
      #
      # @see https://api.slack.com/methods/groups.close
      def groups_close(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.close", params
        Slack::parse_response(response)
      end

      # Creates a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'name'
      #   Name of group to create
      #
      # @see https://api.slack.com/methods/groups.create
      def groups_create(params={})
        raise ArgumentError.new("Required arguments 'name' missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.create", params
        Slack::parse_response(response)
      end

      # Clones and archives a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'channel'
      #  Group to clone and archive.
      #
      # @see https://api.slack.com/methods/groups.createChild
      def groups_create_child(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.createChild", params
        Slack::parse_response(response)
      end

      # Fetches history of messages and events from a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Group to fetch history for.
      # @option params [timestamp] 'latest'
      #   Latest message timestamp to include in results.
      # @option params [timestamp] 'oldest'
      #   Oldest message timestamp to include in results.
      # @option params [Object] 'inclusive'
      #   Include messages with latest or oldest timestamp in results.
      # @option params [Object] 'count'
      #   Number of messages to return, between 1 and 1000.
      #
      # @see https://api.slack.com/methods/groups.history
      def groups_history(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.history", params
        Slack::parse_response(response)
      end

      # Invites a user to a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Private group to invite user to.
      # @option params [user] 'user'
      #   User to invite.
      #
      # @see https://api.slack.com/methods/groups.invite
      def groups_invite(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'user' missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.invite", params
        Slack::parse_response(response)
      end

      # Removes a user from a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Group to remove user from.
      # @option params [user] 'user'
      #   User to remove from group.
      #
      # @see https://api.slack.com/methods/groups.kick
      def groups_kick(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'user' missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.kick", params
        Slack::parse_response(response)
      end

      # Leaves a private group.
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Group to leave
      #
      # @see https://api.slack.com/methods/groups.leave
      def groups_leave(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.leave", params
        Slack::parse_response(response)
      end

      # Lists private groups that the calling user has access to.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'exclude_archived'
      #   Don't return archived groups.
      #
      # @see https://api.slack.com/methods/groups.list
      def groups_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

      # Sets the read cursor in a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Group to set reading cursor in.
      # @option params [timestamp] 'ts'
      #   Timestamp of the most recently seen message.
      #
      # @see https://api.slack.com/methods/groups.mark
      def groups_mark(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'ts' missing") if params['ts'].nil?
        response = @session.do_get "#{SCOPE}.mark", params
        Slack::parse_response(response)
      end

      # Opens a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Group to open.
      #
      # @see https://api.slack.com/methods/groups.open
      def groups_open(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.open", params
        Slack::parse_response(response)
      end

      # Renames a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Group to rename
      # @option params [Object] 'name'
      #   New name for group.
      #
      # @see https://api.slack.com/methods/groups.rename
      def groups_rename(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'name' missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.rename", params
        Slack::parse_response(response)
      end

      # Sets the purpose for a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Private group to set the purpose of
      # @option params [Object] 'purpose'
      #   The new purpose
      #
      # @see https://api.slack.com/methods/groups.setPurpose
      def groups_set_purpose(params={})
        raise ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments :pupose missing") if params['purpos'].nil?
        response = @session.do_get "#{SCOPE}.setPurpose", params
        Slack::parse_response(response)
      end

      # Sets the topic for a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Private group to set the purpose of
      # @option params [Object] 'topic'
      #   The new topic
      #
      # @see https://api.slack.com/methods/groups.setTopic
      def groups_set_topic(params={})
        raise ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments :topic missing") if params['topic'].nil?
        response = @session.do_get "#{SCOPE}.setTopic", params
        Slack::parse_response(response)
      end

      # Unarchives a private group.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [group] 'channel'
      #   Group to unarchive
      # @raise [ArgumentError] if 'channel' is not present
      # @see https://api.slack.com/methods/groups.unarchive
      def groups_unarchive(params={})
        raise ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.unarchive", params
        Slack::parse_response(response)
      end

    end
  end
end
