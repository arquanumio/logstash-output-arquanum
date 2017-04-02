# encoding: utf-8
require "logstash/devutils/rspec/spec_helper"
require "logstash/outputs/arquanum"
require "logstash/codecs/plain"
require "logstash/event"

describe LogStash::Outputs::Arquanum do
  let(:event) do
    LogStash::Event.new(
        'message' => 'this is log message',
        'source' => 'arquanum incidents',
        'type' => 'access',
        '@timestamp' => LogStash::Timestamp.now)

    let(:output) { LogStash::Outputs::Arquanum.new({"api_key" => "api_key_12345"}) }

    describe 'when initializing' do
      it 'should register' do
        expect { output.register }.to_not raise_error
      end

      it 'should set default api_url if not set' do
        expect(output.api_url).to eq('http://api.arquanum.io/logs')
      end

      it 'should set default api_version if not set' do
        expect(output.api_version).to eq('1.0')
      end

      it 'should set default tag if not set' do
        expect(output.tag).to eq('logstash')
      end

      it 'should set api_key correctly' do
        expect(output.api_key).to eq('api_key_12345')
      end
    end

    describe 'when sending messages' do
      it 'should send event' do
        allow(output).to receive(:send_event).with(event.to_json)
        output.receive(event)
      end

      it 'should send message' do
        allow(output).to receive(:send).with(event.to_json)
        output.send_event(event.to_json)
      end
    end
  end
end
