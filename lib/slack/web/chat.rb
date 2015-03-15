module Slack
  module Web
    module Chat
      SCOPE = "chat"

      # Deletes a message.
      def chat_delete(params = {})
        throw ArgumentError.new("Required arguments :ts missing") if params['ts'].nil?
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.delete", params
        Slack::parse_response(response)
      end

      # Sends a message to a channel.
      def chat_post_message(params = {})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :text missing") if params['text'].nil?
        response = @session.do_get "#{SCOPE}.postMessage", params
        Slack::parse_response(response)
      end

      # Updates a message.
      def chat_update(params = {})
        throw ArgumentError.new("Required arguments :ts missing") if params['ts'].nil?
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :text missing") if params['text'].nil?
        response = @session.do_get "#{SCOPE}.update", params
        Slack::parse_response(response)
      end

    end
  end
end
