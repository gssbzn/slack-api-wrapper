module Slack
  module Web
    module Groups
      SCOPE = "groups"

      # Archives a private group.
      def groups_archive(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.archive", params
        Slack::parse_response(response)
      end

      # Closes a private group.
      def groups_close(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.close", params
        Slack::parse_response(response)
      end

      # Creates a private group.
      def groups_create(params={})
        throw ArgumentError.new("Required arguments :name missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.create", params
        Slack::parse_response(response)
      end

      # Clones and archives a private group.
      def groups_create_child(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.createChild", params
        Slack::parse_response(response)
      end

      # Fetches history of messages and events from a private group.
      def groups_history(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.history", params
        Slack::parse_response(response)
      end

      # Invites a user to a private group.
      def groups_invite(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :user missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.invite", params
        Slack::parse_response(response)
      end

      # Removes a user from a private group.
      def groups_kick(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :user missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.kick", params
        Slack::parse_response(response)
      end

      # Leaves a private group.
      def groups_leave(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.leave", params
        Slack::parse_response(response)
      end

      # Lists private groups that the calling user has access to..
      def groups_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

      # Sets the read cursor in a private group.
      def groups_mark(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :ts missing") if params['ts'].nil?
        response = @session.do_get "#{SCOPE}.mark", params
        Slack::parse_response(response)
      end

      # Opens a private group.
      def groups_open(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.open", params
        Slack::parse_response(response)
      end

      # Renames a private group.
      def groups_rename(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :name missing") if params['name'].nil?
        response = @session.do_get "#{SCOPE}.rename", params
        Slack::parse_response(response)
      end

      # Sets the purpose for a private group.
      def groups_set_purpose(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :pupose missing") if params['purpos'].nil?
        response = @session.do_get "#{SCOPE}.setPurpose", params
        Slack::parse_response(response)
      end

      # Sets the topic for a private group.
      def groups_set_topic(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :topic missing") if params['topic'].nil?
        response = @session.do_get "#{SCOPE}.setTopic", params
        Slack::parse_response(response)
      end

      # Unarchives a private group.
      def groups_unarchive(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.unarchive", params
        Slack::parse_response(response)
      end

    end
  end
end
