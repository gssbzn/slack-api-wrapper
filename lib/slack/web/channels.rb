module Slack
  module Web
    module Channels
      SCOPE = "channels"

      # Archives a channel.
      def channels_archive(channel)
        response = @session.do_get "#{SCOPE}.archive", "channel" => channel
        Slack::parse_response(response)
      end

      # Creates a channel.
      def channels_create(name)
        response = @session.do_get "#{SCOPE}.create", "name" => name
        Slack::parse_response(response)
      end

      # Fetches history of messages and events from a channel.
      def channels_history(channel, latest, oldest, inclusive, count)
      end

      # Gets information about a channel.
      def channels_info(channel)
        response = @session.do_get "#{SCOPE}.info", "channel" => channel
        Slack::parse_response(response)
      end

      # Invites a user to a channel.
      def channels_invite(channel, user)
      end

      # Joins a channel, creating it if needed.
      def channels_join(name)
      end

      # Removes a user from a channel.
      def channels_kick(channel, user)
      end

      # Leaves a channel.
      def channels_leave(channel)
      end

      # Lists all channels in a Slack team.
      def channels_list(exclude_archived=0)
        response = @session.do_get "#{SCOPE}.list", "exclude_archived" => exclude_archived
        Slack::parse_response(response)
      end

      # Sets the read cursor in a channel.
      def channels_mark(channel, ts)
      end

      # Renames a channel.
      def channels_rename(channel, name)
      end

      # Sets the purpose for a channel.
      def channels_set_purpose(channel, purpose)
      end

      # Sets the topic for a channel.
      def channels_set_topic(channel, topic)
      end

      # Unarchives a channel.
      def channels_unarchive(channel)
      end

    end
  end
end
