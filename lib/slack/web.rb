# Copyright (c) 2015 Gustavo Bazan
# MIT License

require_relative 'web/api'
require_relative 'web/auth'
require_relative 'web/channels'
require_relative 'web/chat'
require_relative 'web/emoji'
require_relative 'web/files'
require_relative 'web/groups'
require_relative 'web/im'
require_relative 'web/search'
require_relative 'web/stars'
require_relative 'web/team'
require_relative 'web/users'
require_relative 'error'

module Slack
  # Web endpoints methods
  module Web
    include Api
    include Auth
    include Channels
    include Chat
    include Emoji
    include Files
    include Groups
    include Im
    include Stars
    include Search
    include Team
    include Users
  end
end
