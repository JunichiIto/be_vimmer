require 'spec_helper'

describe VimCommand do
  describe "::update_tweets" do
    let(:mode) { Mode.create(label: "test") }
    let!(:vim_command) {
      VimCommand.new(command: "test command", description: "test desc", language: "jp").tap do |command|
        command.mode = mode
        command.save!
      end
    }

    before do
      allow(Twitter).to receive(:configure)
      allow(Twitter).to receive(:update)
    end

    it "updates tweet" do
      expect(Twitter).to receive(:configure).once
      expect(Twitter).to receive(:update).once
      VimCommand.update_tweets("jp", "1", "1", "1")
    end
  end
end
