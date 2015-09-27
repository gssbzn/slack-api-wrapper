require 'spec_helper'

describe Slack do
  it 'has a version number' do
    expect(Slack::VERSION).not_to be nil
  end

  it 'has web server domain' do
    expect(Slack::WEB_SERVER).to eq('slack.com')
  end
end
