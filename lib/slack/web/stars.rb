module Slack
  module Web
    module Stars
      SCOPE = "users"

      # Lists stars for a user.
      def stars_list(user, count, page)
        raise Slack::Error("Not yet implemented, feel free to make a pull request")
      end

    end
  end
end
