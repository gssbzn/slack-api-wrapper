module Slack
  module Web
    module Chat
      SCOPE = "chat"

      # Deletes a message.
      def chat_delete(ts, channel)
        param = {
          "ts" => ts,
          "channel" => channel
        }
        response = @session.do_get "#{SCOPE}.delete", param
        Slack::parse_response(response)
      end

      # Sends a message to a channel.
      def chat_post_message(channel, text, username, as_user= false, parse, link_names, attachments)
        param = {
          "channel" => channel,
          "text" => text,
          "username" => username,
          "as_user" => as_user,
          "parse" => parse,
          "link_names" => link_names,
          "attachments" => attachments
        }
        response = @session.do_get "#{SCOPE}.postMessage", param
        Slack::parse_response(response)
      end

      # Updates a message.
      def chat_update(ts, channel, text)
        param = {
          "ts" => ts,
          "channel" => channel,
          "text" => text
        }
        response = @session.do_get "#{SCOPE}.update", param
        Slack::parse_response(response)
      end

    end
  end
end
