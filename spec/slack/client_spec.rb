require 'spec_helper'

describe Slack::Client do
  it 'Initialize' do
    client = Slack::Client.new("")
    expect(client).not_to be nil
  end
  it 'Validates token is string' do
    expect{Slack::Client.new(1)}.to raise_error(ArgumentError)
  end
  it 'Validates unimplemented methods' do
    client = Slack::Client.new("")
    expect{client.groups_open("")}.to raise_error(Slack::Web::NotImplementedError)
  end
end
