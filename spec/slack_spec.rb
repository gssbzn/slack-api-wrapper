require 'spec_helper'

describe Slack do
  it 'has a version number' do
    expect(Slack::VERSION).not_to be nil
  end

  it 'has web server domain' do
    expect(Slack::WEB_SERVER).to eq('slack.com')
  end

  it 'has api uri' do
    expect(Slack::API_SERVER).to eq('slack.com/api')
  end

  describe '::clean_params' do
    let(:params){ {"test_1"=>"test", "test_2" => nil} }
    it 'removes nil params' do
      expect(Slack::clean_params(params)).to eq({"test_1"=>"test"})
    end
  end
  
  describe '::make_query_string' do
    let(:params){ {"test_1"=>"test", "test_2" => "test"} }
    it 'transform params to query string' do
      expect(Slack::make_query_string(params)).to eq("test_1=test&test_2=test")
    end
  end

end
