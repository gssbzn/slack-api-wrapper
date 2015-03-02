require_relative 'web/auth'
require_relative 'web/channels'
require_relative 'web/chat'
require_relative 'web/emoji'
require_relative 'web/files'
require_relative 'web/groups'
require_relative 'web/im'
require_relative 'web/search'
require_relative 'web/stars'
require_relative 'web/users'
require_relative 'error'

module Slack
  module Web
    include Auth
    include Channels
    include Chat
    include Emoji
    include Files
    include Groups
    include Im
    include Stars
    include Search
    include Users

    class NotImplementedError < Exception; end
  end
end
