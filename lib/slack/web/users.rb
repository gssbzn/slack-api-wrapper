# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the users methods.
    # Get info on members of your Slack team.
    module Users
      # Endpoint scope
      SCOPE = "users"

      # Gets user presence information.
      #
      # @param [Hash] params
      #   API call arguments
      # @option options [user] 'user'
      #   User to get presence info on. Defaults to the authed user.
      #
      # @see https://api.slack.com/methods/users.messages
      def users_get_presence(params={})
        raise ArgumentError.new("Required arguments :user missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.getPresence", params
        Slack::parse_response(response)
      end

      # Gets information about a user.
      #
      # @param [Hash] params
      #   API call arguments
      # @option options [user] 'user'
      #   User to get info on
      #
      # @see https://api.slack.com/methods/users.info
      def users_info(params={})
        raise ArgumentError.new("Required arguments 'user' missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.info", params
        Slack::parse_response(response)
      end

      # Lists all users in a Slack team.
      #
      # @param [Hash] params
      #   API call arguments
      #
      # @see https://api.slack.com/methods/users.list
      def users_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

      # Marks a user as active.
      #
      # @param [Hash] params
      #   API call arguments
      #
      # @see https://api.slack.com/methods/users.setActive
      def users_set_active(params={})
        response = @session.do_get "#{SCOPE}.setActive", params
        Slack::parse_response(response)
      end

      # Manually sets user presence.
      #
      # @param [Hash] params
      #   API call arguments
      # @option options [Object] 'presence'
      #   Either `auto` or `away`
      #
      # @see https://api.slack.com/methods/users.setPresence
      def users_set_presence(params={})
        raise ArgumentError.new("Required arguments 'presence' missing") if params['presence'].nil?
        response = @session.do_get "#{SCOPE}.setPresence", params
        Slack::parse_response(response)
      end

    end
  end
end
