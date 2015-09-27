# Slack API Wrapper
[![Gem Version](https://badge.fury.io/rb/slack-api-wrapper.svg)](http://badge.fury.io/rb/slack-api-wrapper)
[![Build Status](https://travis-ci.org/gssbzn/slack-api-wrapper.svg)](https://travis-ci.org/gssbzn/slack-api-wrapper)
[![Code Climate](https://codeclimate.com/github/gssbzn/slack-api-wrapper/badges/gpa.svg)](https://codeclimate.com/github/gssbzn/slack-api-wrapper)
[![Coverage Status](https://coveralls.io/repos/gssbzn/slack-api-wrapper/badge.svg?branch=master&service=github)](https://coveralls.io/github/gssbzn/slack-api-wrapper)

A library that provides a plain function-call interface to the Slack API web endpoints.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slack-api-wrapper'
```

And then execute:

```console
bundle
```

Or install it yourself as:

```console
gem install 'slack-api-wrapper
```

## Usage

You need to get an api token to use the ruby client.
You can follow Slack documentation about it (https://api.slack.com/docs/oauth),
or use [omniauth-slack](https://github.com/kmrshntr/omniauth-slack) to get one.

```ruby
# Initialize client
client = Slack::Client.new api_token

# Test user token
response = client.auth_test
puts "id: #{response['user_id']}, name: #{response['user']}"

# Get user teammates
response = client.users_list
response['members'].each do |user|
  puts "id: #{user['id']}, name: #{user['name']}"
end

# Get user channels
response = client.channels_list
response['channels'].each do |channel|
  puts "id: #{channel['id']}, name: #{channel['name']}"
end

# Get user private groups
response = client.groups_list
response['groups'].each do |group|
  puts "id: #{group['id']}, name: #{group['name']}"
end

# Posting a message
response = client.chat_post_message('channel'=> 'CXXXX', 'text'=> 'Testing Slack API', 'as_user'=> true)
```

## Additional Resources

Slack API Docs: https://api.slack.com/

## Contributing

1. Fork it ( https://github.com/gssbzn/slack-api-wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT License. Copyright 2015 Gustavo Bazan. http://gustavobazan.com

This software is not created by, affiliated with, or supported by Slack Technologies, Inc.
