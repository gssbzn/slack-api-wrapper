module Slack
  module Web
    module Files
      SCOPE = "files"

      #Deletes a file.
      def files_delete(file)
        response = @session.do_get "#{SCOPE}.delete", "file" => file
        Slack::parse_response(response)
      end

      # Gets information about a team file.
      def files_info(file, count=100, page=1)
        param = {
          "file" => file,
          "count" => count,
          "page" => page
        }
        response = @session.do_get "#{SCOPE}.info", param
        Slack::parse_response(response)
      end

      # Lists & filters team files.
      def files_list(user, ts_from=0, ts_to=Time.now, types="all", count=100, page=1)
        param = {
          "user" => user,
          "ts_from" => ts_from,
          "ts_to" => ts_to,
          "types" => types,
          "count" => count,
          "page" => page
        }
        response = @session.do_get "#{SCOPE}.list", param
        Slack::parse_response(response)
      end

      # Uploads or creates a file.
      def files_upload(file, content, filetype, filename, title, initial_comment, channels)
        param = {
          "file" => file,
          "content" => content,
          "filetype" => filetype,
          "filename" => filename,
          "title" => title,
          "initial_comment" => initial_comment,
          "channels" => channels
        }
        response = @session.do_get "#{SCOPE}.upload", param
        Slack::parse_response(response)
      end
    end
  end
end
