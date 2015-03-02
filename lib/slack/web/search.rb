module Slack
  module Web
    module Search
      SCOPE = "search"

      # Searches for messages and files matching a query.
      def search_all(query, sort, sort_dir, highlight, count, page)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Searches for files matching a query.
      def search_files(query, sort, sort_dir, highlight, count, page)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Searches for messages matching a query.
      def search_messages(query, sort, sort_dir, highlight, count, page)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

    end
  end
end
