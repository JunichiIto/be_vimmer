class VimCommandController < ApplicationController
  def index
    @vim_commands = VimCommand.all
  end
end
