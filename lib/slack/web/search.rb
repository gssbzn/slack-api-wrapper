# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the search methods.
    # Search your team's files and messages.
    module Search
      # Endpoint scope
      SCOPE = "search"

      # Searches for messages and files matching a query.
      #
      # @param [Hash] params
      #   API call arguments
      # @option options [Object] 'query'
      #   Search query. May contains booleans, etc.
      # @option options [Object] 'sort'
      #   Return matches sorted by either `score` or `timestamp`.
      # @option options [Object] 'sort_dir'
      #   Change sort direction to ascending (`asc`) or descending (`desc`).
      # @option options [Object] 'highlight'
      #   Pass a value of `1` to enable query highlight markers.
      # @option params [Object] 'count'
      #   Number of items to return per page.
      # @option params [Object] 'page'
      #   Page number of results to return.
      #
      # @see https://api.slack.com/methods/search.all
      def search_all(params={})
        raise ArgumentError.new("Required arguments 'query' missing") if params['query'].nil?
        response = @session.do_get "#{SCOPE}.all", params
        Slack::parse_response(response)
      end

      # Searches for files matching a query.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'query'
      #   Search query. May contains booleans, etc.
      # @option params [Object] 'sort'
      #   Return matches sorted by either `score` or `timestamp`.
      # @option params [Object] 'sort_dir'
      #   Change sort direction to ascending (`asc`) or descending (`desc`).
      # @option params [Object] 'highlight'
      #   Pass a value of `1` to enable query highlight markers.
      # @option params [Object] 'count'
      #   Number of items to return per page.
      # @option params [Object] 'page'
      #   Page number of results to return.
      #
      # @see https://api.slack.com/methods/search.files
      def search_files(params={})
        raise ArgumentError.new("Required arguments 'query' missing") if params['query'].nil?
        response = @session.do_get "#{SCOPE}.files", params
        Slack::parse_response(response)
      end

      # Searches for messages matching a query.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'query'
      #   Search query. May contains booleans, etc.
      # @option params [Object] 'sort'
      #   Return matches sorted by either `score` or `timestamp`.
      # @option params [Object] 'sort_dir'
      #   Change sort direction to ascending (`asc`) or descending (`desc`).
      # @option params [Object] 'highlight'
      #   Pass a value of `1` to enable query highlight markers.
      # @option params [Object] 'count'
      #   Number of items to return per page.
      # @option params [Object] 'page'
      #   Page number of results to return.
      #
      # @see https://api.slack.com/methods/search.messages
      def search_messages(params={})
        raise ArgumentError.new("Required arguments 'query' missing") if params['query'].nil?
        response = @session.do_get "#{SCOPE}.messages", params
        Slack::parse_response(response)
      end

    end
  end
end
