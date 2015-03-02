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
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Gets information about a channel.
      def channels_info(channel)
        response = @session.do_get "#{SCOPE}.info", "channel" => channel
        Slack::parse_response(response)
      end

      # Invites a user to a channel.
      def channels_invite(channel, user)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Joins a channel, creating it if needed.
      def channels_join(name)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Removes a user from a channel.
      def channels_kick(channel, user)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Leaves a channel.
      def channels_leave(channel)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Lists all channels in a Slack team.
      def channels_list(exclude_archived=0)
        response = @session.do_get "#{SCOPE}.list", "exclude_archived" => exclude_archived
        Slack::parse_response(response)
      end

      # Sets the read cursor in a channel.
      def channels_mark(channel, ts)
        raise Slack::Error("Not yet implemented, feel free to make a pull request")
      end

      # Renames a channel.
      def channels_rename(channel, name)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Sets the purpose for a channel.
      def channels_set_purpose(channel, purpose)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Sets the topic for a channel.
      def channels_set_topic(channel, topic)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Unarchives a channel.
      def channels_unarchive(channel)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

    end
  end
end
