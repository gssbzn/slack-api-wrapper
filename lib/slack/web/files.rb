module Slack
  module Web
    module Files
      SCOPE = "files"

      #Deletes a file.
      def files_delete(params={})
        throw ArgumentError.new("Required arguments :file missing") if params['file'].nil?
        response = @session.do_get "#{SCOPE}.delete", params
        Slack::parse_response(response)
      end

      # Gets information about a team file.
      def files_info(params={})
        throw ArgumentError.new("Required arguments :file missing") if params['file'].nil
        response = @session.do_get "#{SCOPE}.info", params
        Slack::parse_response(response)
      end

      # Lists & filters team files.
      def files_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

      # Uploads or creates a file.
      def files_upload(params={})
        response = @session.do_get "#{SCOPE}.upload", params
        Slack::parse_response(response)
      end
    end
  end
end
