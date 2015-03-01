module Slack
  module Web
    module Groups
      SCOPE = "groups"

      # Archives a private group.
      def groups_archive(channel)
        response = @session.do_get "#{SCOPE}.archive", "channel" => channel
        Slack::parse_response(response)
      end

      # Closes a private group.
      def groups_close(channel)
        response = @session.do_get "#{SCOPE}.close", "channel" => channel
        Slack::parse_response(response)
      end

      # Creates a private group.
      def groups_create(name)
        response = @session.do_get "#{SCOPE}.create", "name" => name
        Slack::parse_response(response)
      end

      # Clones and archives a private group.
      def groups_create_child(channel)
        response = @session.do_get "#{SCOPE}.createChild", "channel" => channel
        Slack::parse_response(response)
      end

      # Fetches history of messages and events from a private group.
      def groups_history(channel, latest, oldest, inclusive, count)
      end

      # Invites a user to a private group.
      def groups_invite(channel, user)
      end

      # Removes a user from a private group.
      def groups_kick(channel, user)
      end

      # Leaves a private group.
      def groups_leave(channel)
      end

      # Lists private groups that the calling user has access to..
      def groups_list(exclude_archived=0)
        response = @session.do_get "#{SCOPE}.list", "exclude_archived" => exclude_archived
        Slack::parse_response(response)
      end

      # Sets the read cursor in a private group.
      def groups_mark(channel, ts)
      end

      # Opens a private group.
      def groups_open(channel)
      end

      # Renames a private group.
      def groups_rename(channel, name)
      end

      # Sets the purpose for a private group.
      def groups_set_purpose(channel, purpose)
      end

      # Sets the topic for a private group.
      def groups_set_topic(channel, topic)
      end

      # Unarchives a private group.
      def groups_unarchive(channel)
      end

    end
  end
end
