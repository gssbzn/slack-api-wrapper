module Slack
  module Web
    module Users
      SCOPE = "users"

      # Gets user presence information.
      def users_get_presence(user)
        response = @session.do_get "#{SCOPE}.getPresence", "user" => user
        Slack::parse_response(response)
      end

      # Gets information about a user.
      def users_info(user)
        response = @session.do_get "#{SCOPE}.info", "user" => user
        Slack::parse_response(response)
      end

      # Lists all users in a Slack team.
      def users_list
        response = @session.do_get "#{SCOPE}.list"
        Slack::parse_response(response)
      end

      # Marks a user as active.
      def users_set_active
        response = @session.do_get "#{SCOPE}.setActive"
        Slack::parse_response(response)
      end

      # Manually sets user presence.
      def users_set_presence(presence)
        response = @session.do_get "#{SCOPE}.setPresence", "presence" => presence
        Slack::parse_response(response)
      end

    end
  end
end
