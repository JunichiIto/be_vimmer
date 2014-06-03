require 'spec_helper'

describe VimCommand do
  describe "::twitter_client" do
    let(:env_hash) {
      {
          "twitter_consumer_key_jp" => "123",
          "twitter_consumer_secret_jp" => "456",
          "twitter_oauth_token_jp" => "789",
          "twitter_oauth_token_secret_jp" => "abc",
      }
    }
    let(:twitter_client) { VimCommand.twitter_client("jp") }
    before do
      stub_const('ENV', env_hash)
    end
    specify { expect(twitter_client.instance_variable_get(:@consumer_key)).to eq '123' }
    specify { expect(twitter_client.instance_variable_get(:@consumer_secret)).to eq '456' }
    specify { expect(twitter_client.instance_variable_get(:@access_token)).to eq '789' }
    specify { expect(twitter_client.instance_variable_get(:@access_token_secret)).to eq 'abc' }
    it "resnponds to :update" do
      expect(twitter_client.respond_to? :update).to be_truthy
    end
  end

  describe "::update_tweets" do
    let(:mode) { Mode.create(label: "test") }
    let!(:vim_command) do
      VimCommand.new(command: "test command", description: "test desc", language: "jp").tap do |command|
        command.mode = mode
        command.save!
      end
    end

    it "updates tweet" do
      twitter = double(:twitter)
      expect(twitter).to receive(:update).once
      allow(VimCommand).to receive(:twitter_client).with("jp").and_return(twitter)
      VimCommand.update_tweets("jp", "1", "1", "1")
    end
  end
end
