module Slack
  module Web
    module Channels
      SCOPE = "channels"

      # Archives a channel.
      def channels_archive(params = {})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.archive", params
        Slack::parse_response(response)
      end

      # Creates a channel.
      def channels_create(params = {})
        throw ArgumentError.new("Required arguments :name missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.create", params
        Slack::parse_response(response)
      end

      # Fetches history of messages and events from a channel.
      def channels_history(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.history", params
        Slack::parse_response(response)
      end

      # Gets information about a channel.
      def channels_info(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.info", params
        Slack::parse_response(response)
      end

      # Invites a user to a channel.
      def channels_invite(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :user missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.invite", params
        Slack::parse_response(response)
      end

      # Joins a channel, creating it if needed.
      def channels_join(params={})
        throw ArgumentError.new("Required arguments :name missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.join", params
        Slack::parse_response(response)
      end

      # Removes a user from a channel.
      def channels_kick(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :user missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.kick", params
        Slack::parse_response(response)
      end

      # Leaves a channel.
      def channels_leave(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.leave", params
        Slack::parse_response(response)
      end

      # Lists all channels in a Slack team.
      def channels_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

      # Sets the read cursor in a channel.
      def channels_mark(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :ts missing") if params['ts'].nil?
        response = @session.do_get "#{SCOPE}.mark", params
        Slack::parse_response(response)
      end

      # Renames a channel.
      def channels_rename(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :name missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.rename", params
        Slack::parse_response(response)
      end

      # Sets the purpose for a channel.
      def channels_set_purpose(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :purpose missing") if params['purpose'].nil?
        response = @session.do_get "#{SCOPE}.setPurpose", params
        Slack::parse_response(response)
      end

      # Sets the topic for a channel.
      def channels_set_topic(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :topic missing") if params['topic'].nil?
        response = @session.do_get "#{SCOPE}.setTopic", params
        Slack::parse_response(response)
      end

      # Unarchives a channel.
      def channels_unarchive(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.unarchive", params
        Slack::parse_response(response)
      end

    end
  end
end
