module Slack
  module Web
    module Search
      SCOPE = "search"

      # Searches for messages and files matching a query.
      def search_all(params={})
        throw ArgumentError.new("Required arguments :query missing") if params['query'].nil?
        response = @session.do_get "#{SCOPE}.all", params
        Slack::parse_response(response)
      end

      # Searches for files matching a query.
      def search_files(params={})
        throw ArgumentError.new("Required arguments :query missing") if params['query'].nil?
        response = @session.do_get "#{SCOPE}.files", params
        Slack::parse_response(response)
      end

      # Searches for messages matching a query.
      def search_messages(params={})
        throw ArgumentError.new("Required arguments :query missing") if params['query'].nil?
        response = @session.do_get "#{SCOPE}.messages", params
        Slack::parse_response(response)
      end

    end
  end
end
