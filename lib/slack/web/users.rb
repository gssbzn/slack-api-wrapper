module Slack
  module Web
    module Users
      SCOPE = "users"

      # Gets user presence information.
      def users_get_presence(params={})
        throw ArgumentError.new("Required arguments :user missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.getPresence", params
        Slack::parse_response(response)
      end

      # Gets information about a user.
      def users_info(params={})
        throw ArgumentError.new("Required arguments :user missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.info", params
        Slack::parse_response(response)
      end

      # Lists all users in a Slack team.
      def users_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

      # Marks a user as active.
      def users_set_active(params={})
        response = @session.do_get "#{SCOPE}.setActive", params
        Slack::parse_response(response)
      end

      # Manually sets user presence.
      def users_set_presence(params={})
        throw ArgumentError.new("Required arguments :presence missing") if params['presence'].nil?
        response = @session.do_get "#{SCOPE}.setPresence", params
        Slack::parse_response(response)
      end

    end
  end
end
