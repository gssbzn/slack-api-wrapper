require 'spec_helper'

describe Slack::Session do
  it 'Initialize' do
    session = Slack::Session.new('')
    expect(session).not_to be nil
  end
  it 'Validates token is string' do
    expect { Slack::Session.new(1) }.to raise_error(ArgumentError)
  end

  describe "instance methods" do
    subject(:session) { Slack::Session.new('') }

    describe '#clean_params' do
      let(:params) { { 'test_1' => 'test', 'test_2' => nil } }
      it 'removes nil params' do
        expect(session.clean_params(params)).to eq('test_1' => 'test')
      end
    end

    describe '#make_query_string' do
      let(:params) { { 'test_1' => 'test', 'test_2' => 'test' } }
      it 'transform params to query string' do
        expect(session.make_query_string(params)).to eq('test_1=test&test_2=test')
      end
    end
  end
end
