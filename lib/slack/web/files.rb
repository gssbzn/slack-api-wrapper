# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the files methods.
    # Get info on files uploaded to Slack, upload new files to Slack.
    module Files
      # Endpoint scope
      SCOPE = 'files'

      # Deletes a file.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [file] 'file'
      #   ID of file to delete.
      #
      # @see https://api.slack.com/methods/files.delete
      def files_delete(params = {})
        fail ArgumentError, "Required arguments 'file' missing" if params['file'].nil?
        response = @session.do_post "#{SCOPE}.delete", params
        Slack.parse_response(response)
      end

      # Gets information about a team file.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [file] 'file'
      #   File to fetch info for
      # @option params [Object] 'count'
      #   Number of items to return per page.
      # @option params [Object] 'page'
      #   Page number of results to return.
      #
      # @see https://api.slack.com/methods/files.info
      def files_info(params = {})
        fail ArgumentError, "Required arguments 'file' missing" if params['file'].nil?
        response = @session.do_post "#{SCOPE}.info", params
        Slack.parse_response(response)
      end

      # Lists & filters team files.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [user] 'user'
      #   Filter files created by a single user.
      # @option params [Object] 'ts_from'
      #   Filter files created after this timestamp (inclusive).
      # @option params [Object] 'ts_to'
      #   Filter files created before this timestamp (inclusive).
      # @option params [Object] 'types'
      #   Filter files by type:
      #
      #   * `all` - All files
      #   * `posts` - Posts
      #   * `snippets` - Snippets
      #   * `images` - Image files
      #   * `gdocs` - Google docs
      #   * `zips` - Zip files
      #   * `pdfs` - PDF files
      #
      #   You can pass multiple values in the types argument, like `types=posts,snippets`.The default value is `all`, which does not filter the list.
      # @option params [Object] 'count'
      #   Number of items to return per page.
      # @option params [Object] 'page'
      #   Page number of results to return.
      #
      # @see https://api.slack.com/methods/files.list
      def files_list(params = {})
        response = @session.do_post "#{SCOPE}.list", params
        Slack.parse_response(response)
      end

      # Uploads or creates a file.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'file'
      #   File contents via `multipart/form-data`.
      # @option params [Object] 'content'
      #   File contents via a POST var.
      # @option params [Object] 'filetype'
      #   Slack-internal file type identifier.
      # @option params [Object] 'filename'
      #   Filename of file.
      # @option params [Object] 'title'
      #   Title of file.
      # @option params [Object] 'initial_comment'
      #   Initial comment to add to file.
      # @option params [channel] 'channels'
      #   Comma separated list of channels to share the file into.
      # @see https://api.slack.com/methods/files.upload
      def files_upload(params = {})
        response = @session.do_post "#{SCOPE}.upload", params
        Slack.parse_response(response)
      end
    end
  end
end
