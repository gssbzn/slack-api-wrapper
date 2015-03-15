module Slack
  module Web
    module Stars
      SCOPE = "stars"

      # Lists stars for a user.
      def stars_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

    end
  end
end
